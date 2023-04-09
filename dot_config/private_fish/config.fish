if status is-interactive
    starship init fish | source
    zoxide init fish | source
end

if test "$TERM" = "xterm-kitty"
    alias ssh="kitty +kitten ssh"
end

if test -d $HOME/.bin
    if not contains -- $HOME/.bin $PATH
        set -p PATH $PATH $HOME/.bin
    end
end

if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end

# Disable greeting message
set fish_greeting


set -xg BAT_THEME "Catppuccin-frappe"
set -xg EDITOR "nvim"
set -xg SSH_AUTH_SOCK $XDG_RUNTIME_DIR/keyring/ssh
set -xg LS_COLORS (vivid generate catppuccin-frappe)

set -xg FZF_DEFAULT_OPTS "\
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"


alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='exa --git --group-directories-first --icons'
alias cat='bat'
