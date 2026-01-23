#!/usr/bin/env bash

if [[ -d ~/.config/emacs ]]; then
    echo "Doom Emacs already installed, skipping."
    exit 0
fi

git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install
