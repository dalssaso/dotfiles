#!/usr/bin/env fish

echo (which fish) | sudo tee -a /etc/shells
chsh -s (which fish)
