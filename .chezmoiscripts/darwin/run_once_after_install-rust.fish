#!/usr/bin/env fish

# Fish may not have /opt/homebrew/bin in PATH yet at this point,
# so reference the Homebrew-linked binary directly.
/opt/homebrew/bin/rustup-init --profile complete -y
