if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test "$TERM" = "xterm-kitty"
    alias ssh="kitty +kitten ssh"
end

starship init fish | source
zoxide init fish | source

set -xg BAT_THEME "Catppuccin-frappe"
set -xg EDITOR "nvim"

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"


alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='exa --git'
alias cat='bat'

set -xg LS_COLORS (vivid generate catppuccin-frappe)

source ~/.asdf/asdf.fish


