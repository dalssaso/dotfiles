#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Daily Task
# @raycast.mode silent
# @raycast.argument1 { "type": "text", "placeholder": "Task description" }
# @raycast.packageName Org Capture

# Optional parameters:
# @raycast.icon ✅

TASK="$1"
EMACSCLIENT="/opt/homebrew/bin/emacsclient"

if [[ ! -x "$EMACSCLIENT" ]]; then
  echo "Error: emacsclient not found"
  exit 1
fi

if [ -z "$TASK" ]; then
  echo "Error: Task description required"
  exit 1
fi

# Escape quotes for elisp
TASK_ESCAPED=$(echo "$TASK" | sed 's/"/\\"/g')

if "$EMACSCLIENT" --eval "(hd/roam-dailies-capture-cli \"t\" '(:initial \"$TASK_ESCAPED\"))"; then
  echo "Task added: $TASK"
else
  echo "Failed to add task"
  exit 1
fi
