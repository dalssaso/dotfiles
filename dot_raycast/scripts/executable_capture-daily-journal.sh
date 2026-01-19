#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Daily Journal
# @raycast.mode silent
# @raycast.argument1 { "type": "text", "placeholder": "Journal entry", "optional": true }
# @raycast.packageName Org Capture

# Optional parameters:
# @raycast.icon 📓

ENTRY="$1"
EMACSCLIENT="/opt/homebrew/bin/emacsclient"

if [[ ! -x "$EMACSCLIENT" ]]; then
  echo "Error: emacsclient not found"
  exit 1
fi

# Escape quotes for elisp
ENTRY_ESCAPED=$(echo "$ENTRY" | sed 's/"/\\"/g')

if "$EMACSCLIENT" --eval "(hd/roam-dailies-capture-cli \"j\" '(:initial \"$ENTRY_ESCAPED\"))"; then
  echo "Journal entry added"
else
  echo "Failed to add journal entry"
  exit 1
fi
