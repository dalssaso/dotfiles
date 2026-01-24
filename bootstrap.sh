#!/bin/zsh
set -euo pipefail

info() { printf '  [ \033[00;34m..\033[0m ] %s\n' "$1"; }
success() { printf '  [ \033[00;32mOK\033[0m ] %s\n' "$1"; }
fail() { printf '  [ \033[0;31mFAIL\033[0m ] %s\n' "$1"; exit 1; }

# Step 1: Xcode Command Line Tools
if xcode-select -p &>/dev/null; then
  success "Xcode Command Line Tools already installed"
else
  info "Installing Xcode Command Line Tools..."
  xcode-select --install
  # Wait for installation to complete
  until xcode-select -p &>/dev/null; do
    sleep 5
  done
  success "Xcode Command Line Tools installed"
fi

# Step 2: Homebrew
if command -v brew &>/dev/null; then
  success "Homebrew already installed"
else
  info "Installing Homebrew..."
  info "Homebrew requires sudo access. Please enter your password:"
  sudo -v || fail "sudo authentication failed"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || fail "Homebrew installation failed"
  # Add brew to PATH for the rest of this script
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  else
    fail "Homebrew installed but brew binary not found"
  fi
  success "Homebrew installed"
fi

# Step 3: chezmoi
if brew list chezmoi &>/dev/null; then
  success "chezmoi already installed"
else
  info "Installing chezmoi..."
  brew install chezmoi || fail "chezmoi installation failed"
  success "chezmoi installed"
fi

# Step 4: Initialize and apply dotfiles
info "Running chezmoi init --apply dalssaso/dotfiles..."
chezmoi init --apply dalssaso/dotfiles || fail "chezmoi init --apply failed"
success "Dotfiles applied successfully"
