if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

set -xg BAT_THEME "Catppuccin-frappe"
set -xg EDITOR "nvim"
alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='exa --git'
alias cat='bat'

set -xg LS_COLORS (vivid generate catppuccin-frappe)
