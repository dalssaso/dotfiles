# dotfiles

Personal dotfiles managed with [chezmoi](https://www.chezmoi.io/) for macOS with automated setup scripts.

## Features

- Automated package installation via Homebrew
- Encrypted secrets management with age encryption
- Fish shell configuration with vi keybindings
- Development tools setup (Go, Rust, Node.js, Python)
- Kubernetes and cloud infrastructure tools
- Terminal environment (Ghostty, Wezterm, Tmux)
- Neovim configuration

## Prerequisites

- macOS 10.15 or later
- Command Line Tools: `xcode-select --install`

## Quick Start

### Initial Setup

1. Install chezmoi and initialize dotfiles:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply dalssaso/dotfiles
```

2. During first run, you'll be prompted for:
   - Email address
   - Work email address
   - Whether this is a work machine

3. The setup will automatically:
   - Install 1Password and 1Password CLI
   - Install packages from Brewfile
   - Configure age encryption for secrets
   - Set up Fish shell as default
   - Install development tools via mise
   - Configure macOS system preferences

### Manual Application

After making changes to dotfiles:

```bash
chezmoi apply
```

To see what would change without applying:

```bash
chezmoi diff
```

## Repository Structure

```
.
├── dot_config/              # Application configurations
│   ├── bat/                 # bat (cat alternative) config
│   ├── btop/                # btop system monitor
│   ├── eza/                 # eza (ls alternative) config
│   ├── ghostty/             # Ghostty terminal
│   ├── lazygit/             # LazyGit TUI
│   ├── nvim/                # Neovim configuration
│   ├── private_fish/        # Fish shell config
│   ├── tmux/                # Tmux configuration
│   ├── wezterm/             # WezTerm terminal
│   └── starship.toml        # Starship prompt
├── dot_scripts/             # Personal scripts
│   └── work/                # Work-specific scripts
├── dot_ssh/                 # SSH configuration
│   └── encrypted_config.age # Encrypted SSH config
├── .chezmoiscripts/         # Automated setup scripts
│   └── darwin/              # macOS-specific scripts
├── private_Applications/    # macOS Applications
├── private_Library/         # macOS Library files
├── encrypted_*              # Encrypted configs (git, authinfo, wakatime, netrc)
├── Brewfile                 # Homebrew packages
├── dot_tool-versions        # mise/asdf tool versions
├── dot_default-golang-pkgs  # Default Go packages to install
├── dot_default-npm-packages # Default npm packages to install
├── .chezmoi.toml.tmpl       # chezmoi configuration template
└── .chezmoiignore           # Files to ignore during apply
```

## Installed Tools & Applications

### Development Tools

- **Languages**: Go, Rust, Python 3.11/3.12, Node.js, Lua
- **Version Management**: mise (asdf successor)
- **Editors**: Neovim, Emacs 30
- **Shell**: Fish with vi keybindings, Starship prompt

### Terminal Tools

- **File Navigation**: eza, fd, fzf, zoxide
- **File Viewing**: bat, less
- **System Monitoring**: btop, htop
- **Git**: lazygit, git-delta, gh, glab
- **Search**: ripgrep, the_silver_searcher
- **Multiplexers**: tmux, zellij

### Cloud & Infrastructure

- **Kubernetes**: kubectl, k9s, helm, kustomize, kubectx, krew, minikube
- **AWS**: awscli, clusterawsadm, clusterctl
- **Terraform/IaC**: terraform, pulumi, ansible
- **Service Mesh/Tools**: consul, vault, argocd, temporal
- **Containers**: docker, orbstack, dive, skaffold, tilt

### Productivity

- **Terminals**: Ghostty, WezTerm
- **Password**: 1Password + 1Password CLI
- **Launcher**: Raycast
- **Automation**: Keyboard Maestro
- **Communication**: Slack, Telegram, WhatsApp, Discord, Zoom

## Encrypted Files

Sensitive configuration files are encrypted using age:

- `.gitconfig` (personal, work, and OSS variants)
- `.authinfo.gpg` (personal and work)
- `.ssh/config`
- `.wakatime.cfg`
- `.netrc`

The age key is decrypted from 1Password during initial setup.

## chezmoi Scripts

Scripts in `.chezmoiscripts/darwin/` run automatically:

### Before Scripts

- `run_once_before_01_decrypt-age-key.sh` - Decrypts age encryption key from 1Password
- `run_once_before_02_configure-sudo-passwordless.sh` - Configures passwordless sudo
- `run_onchange_before_install-packages.sh` - Installs packages from Brewfile

### After Scripts

- `run_once_after_change-default-shell.sh` - Changes default shell to Fish
- `run_once_after_configure-gpg-keys.fish` - Sets up GPG keys
- `run_once_after_configure-ssh-keys.fish` - Configures SSH keys
- `run_once_after_install-fisher.fish` - Installs Fisher plugin manager
- `run_once_after_install-mise.fish` - Installs mise version manager
- `run_once_after_install-rust.fish` - Installs Rust toolchain
- `run_once_after_install-tpm.fish` - Installs Tmux Plugin Manager
- `run_once_after_bat-cache-build.fish` - Builds bat cache
- `run_once_after_enable-fish-vi-keybindings.fish` - Enables vi keybindings
- `run_once_after_fish-pieces-config.fish` - Configures Fish Pieces
- `run_once_after_macos_settings.sh` - Applies macOS system preferences

## Common Tasks

### Update chezmoi and dotfiles

```bash
chezmoi update
```

### Edit a dotfile

```bash
chezmoi edit ~/.config/fish/config.fish
```

### Add a new file

```bash
chezmoi add ~/.config/newapp/config.toml
```

### Re-run setup scripts

```bash
chezmoi state delete-bucket --bucket=scriptState
chezmoi apply
```

### Update Brewfile

After installing new packages with `brew install`:

```bash
brew bundle dump --force --file=~/.local/share/chezmoi/Brewfile
```

## Troubleshooting

### Age decryption fails

Ensure 1Password CLI is installed and configured:

```bash
op signin
```

### Brew bundle fails

Update Homebrew and try again:

```bash
brew update
brew doctor
```

### Fish shell not default

Manually change shell:

```bash
chsh -s $(which fish)
```
