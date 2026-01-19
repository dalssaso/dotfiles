#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Capture Link
# @raycast.mode silent
# @raycast.argument1 { "type": "text", "placeholder": "URL" }
# @raycast.argument2 { "type": "text", "placeholder": "Category (optional)", "optional": true }
# @raycast.packageName Org Capture

# Optional parameters:
# @raycast.icon 🔗

URL="$1"
CATEGORY="$2"

# Validate URL
if [[ ! "$URL" =~ ^https?:// ]]; then
  echo "Invalid URL: $URL"
  exit 1
fi

# Fetch metadata using htmlq
if command -v htmlq &> /dev/null; then
  HTML=$(curl -sL --max-time 10 "$URL")
  # Use sed to trim whitespace instead of xargs (xargs fails on unbalanced quotes)
  TITLE=$(echo "$HTML" | htmlq --text 'title' 2>/dev/null | head -1 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
  SUMMARY=$(echo "$HTML" | htmlq --attribute content 'meta[name="description"]' 2>/dev/null | head -1 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')

  # Fallback to og:description
  [ -z "$SUMMARY" ] && SUMMARY=$(echo "$HTML" | htmlq --attribute content 'meta[property="og:description"]' 2>/dev/null | head -1 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
else
  # Fallback without htmlq
  TITLE=""
  SUMMARY=""
fi

# Final fallbacks
[ -z "$TITLE" ] && TITLE="$URL"
[ -z "$SUMMARY" ] && SUMMARY=""

EMACSCLIENT="/opt/homebrew/bin/emacsclient"

if [[ ! -x "$EMACSCLIENT" ]]; then
  echo "Error: emacsclient not found at $EMACSCLIENT"
  exit 1
fi

# Escape double quotes for elisp
TITLE_ESCAPED=$(echo "$TITLE" | sed 's/"/\\"/g')
SUMMARY_ESCAPED=$(echo "$SUMMARY" | sed 's/"/\\"/g')

if [ -z "$CATEGORY" ]; then
  # Quick capture → daily
  if "$EMACSCLIENT" --eval "(hd/roam-dailies-capture-cli \"l\" '(:link \"$URL\" :description \"$TITLE_ESCAPED\" :initial \"$SUMMARY_ESCAPED\"))"; then
    echo "Captured: $TITLE"
  else
    echo "Failed to capture: $TITLE"
    exit 1
  fi
else
  # Detailed capture → roam note (uses standard org-capture)
  ORG_CAPTURE="$HOME/.config/emacs/bin/org-capture"
  SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//' | cut -c1-50)

  if "$ORG_CAPTURE" -k "L" -- ":url" "$URL" ":title" "$TITLE" ":slug" "$SLUG" ":category" "$CATEGORY" ":body" "$SUMMARY"; then
    echo "Captured as note: $TITLE"
  else
    echo "Failed to capture: $TITLE"
    exit 1
  fi
fi
