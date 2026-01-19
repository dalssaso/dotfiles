#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Daily Note
# @raycast.mode silent
# @raycast.argument1 { "type": "text", "placeholder": "Note content", "optional": true }
# @raycast.packageName Org Capture

# Optional parameters:
# @raycast.icon 📝

CONTENT="$1"
EMACSCLIENT="/opt/homebrew/bin/emacsclient"

if [[ ! -x "$EMACSCLIENT" ]]; then
  echo "Error: emacsclient not found"
  exit 1
fi

# Escape quotes for elisp
CONTENT_ESCAPED=$(echo "$CONTENT" | sed 's/"/\\"/g')

if "$EMACSCLIENT" --eval "(hd/roam-dailies-capture-cli \"d\" '(:initial \"$CONTENT_ESCAPED\"))"; then
  echo "Added to daily"
else
  echo "Failed to capture"
  exit 1
fi
