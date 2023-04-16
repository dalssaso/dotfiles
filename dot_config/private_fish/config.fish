if status is-interactive
    zoxide init fish | source
end

# Old commands are not shown with full prompt
function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

if test "$TERM" = "xterm-kitty"
    alias ssh="kitty +kitten ssh"
end

if test -d $HOME/.bin
    if not contains -- $HOME/.bin $PATH
        set -p PATH $PATH $HOME/.bin
    end
end

if test -d $HOME/.local/bin
    if not contains -- $HOME/.local/bin $PATH
        set -p PATH $PATH $HOME/.local/bin
    end
end

if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end

# Disable greeting message
set fish_greeting


set -xg BAT_THEME "Catppuccin-mocha"
set -xg EDITOR "nvim"
set -xg SSH_AUTH_SOCK $XDG_RUNTIME_DIR/keyring/ssh
set -xg LS_COLORS (vivid generate catppuccin-mocha)

# set -xg FZF_DEFAULT_OPTS "\
# --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
# --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
# --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

set -xg FZF_DEFAULT_OPTS "\
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7aa2f7,pointer:#db4b4b \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"


alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='exa --git --group-directories-first --icons'
alias cat='bat'
alias kslack='pkill slack'
