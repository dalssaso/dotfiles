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
  TITLE=$(echo "$HTML" | htmlq --text 'title' 2>/dev/null | head -1 | xargs)
  SUMMARY=$(echo "$HTML" | htmlq --attribute content 'meta[name="description"]' 2>/dev/null | head -1 | xargs)

  # Fallback to og:description
  [ -z "$SUMMARY" ] && SUMMARY=$(echo "$HTML" | htmlq --attribute content 'meta[property="og:description"]' 2>/dev/null | head -1 | xargs)
else
  # Fallback without htmlq
  TITLE=""
  SUMMARY=""
fi

# Final fallbacks
[ -z "$TITLE" ] && TITLE="$URL"
[ -z "$SUMMARY" ] && SUMMARY=""

ORG_CAPTURE="$HOME/.config/emacs/bin/org-capture"

if [ -z "$CATEGORY" ]; then
  # Quick capture → daily
  "$ORG_CAPTURE" \
    -k "l" \
    -- \
    ":link" "$URL" \
    ":description" "$TITLE" \
    ":initial" "$SUMMARY"
else
  # Detailed capture → roam note
  # Generate slug from title
  SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]/-/g' | sed 's/--*/-/g' | sed 's/^-//' | sed 's/-$//' | cut -c1-50)

  "$ORG_CAPTURE" \
    -k "L" \
    -- \
    ":url" "$URL" \
    ":title" "$TITLE" \
    ":slug" "$SLUG" \
    ":category" "$CATEGORY" \
    ":body" "$SUMMARY"
fi

echo "Captured: $TITLE"
