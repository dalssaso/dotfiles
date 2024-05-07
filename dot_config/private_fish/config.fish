if test -d /opt/homebrew/bin
    set -p PATH /opt/homebrew/bin $PATH
end

if status is-interactive
    zoxide init fish | source
end

# Old commands are not shown with full prompt
function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

if test -d $HOME/.bin
    if not contains -- $HOME/.bin $PATH
        set -p PATH $PATH $HOME/.bin
    end
end

if test -d /opt/homebrew/opt/gnupg@2.2/bin
    if not contains -- /opt/homebrew/opt/gnupg@2.2/bin $PATH
        set -p PATH /opt/homebrew/opt/gnupg@2.2/bin $PATH
    end
end

if test -d $HOME/.local/bin
    if not contains -- $HOME/.local/bin $PATH
        set -p PATH $PATH $HOME/.local/bin
    end
end

if test -d $HOME/.cargo/bin
    if not contains -- $HOME/.cargo/bin $PATH
        set -p PATH $PATH $HOME/.cargo/bin
    end
end

if test -d /opt/homebrew/opt/python@3.11/libexec/bin
    if not contains -- /opt/homebrew/opt/python@3.11/libexec/bin $PATH
        set -p PATH /opt/homebrew/opt/python@3.11/libexec/bin $PATH
    end
end

if test -d /opt/homebrew/opt/grep/libexec/gnubin
    if not contains -- /opt/homebrew/opt/grep/libexec/gnubin $PATH
        set -p PATH /opt/homebrew/opt/grep/libexec/gnubin $PATH
    end
end

if test -d /opt/homebrew/opt/binutils/bin
    if not contains -- /opt/homebrew/opt/binutils/bin $PATH
        set -p PATH /opt/homebrew/opt/binutils/bin $PATH
    end
end

if test -d /opt/homebrew/opt/coreutils/libexec/gnubin
    if not contains -- /opt/homebrew/opt/coreutils/libexec/gnubin $PATH
        set -p PATH /opt/homebrew/opt/coreutils/libexec/gnubin $PATH
    end
end

if test -d /opt/homebrew/opt/gnu-sed/libexec/gnubin
    if not contains -- /opt/homebrew/opt/gnu-sed/libexec/gnubin $PATH
        set -p PATH /opt/homebrew/opt/gnu-sed/libexec/gnubin $PATH
    end
end

if test -d /opt/homebrew/opt/postgresql@15/bin
    set -g LDFLAGS "-L/opt/homebrew/opt/postgresql@15/lib"
    set -g CPPFLAGS "-I/opt/homebrew/opt/postgresql@15/include"

    if not contains -- /opt/homebrew/opt/postgresql@15/bin $PATH
        set -p PATH /opt/homebrew/opt/postgresql@15/bin $PATH
    end
end

set -gx PATH $PATH $HOME/.krew/bin

varclear PATH

if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end

source ~/.asdf/plugins/golang/set-env.fish

# Disable greeting message
set fish_greeting

set -xg BAT_THEME Catppuccin-mocha
set -xg EDITOR nvim
set -xg LS_COLORS (vivid generate catppuccin-mocha)
set -xg VISUAL nvim
set -xg ZK_NOTEBOOK_DIR $HOME/Dropbox/zk
set -xg GOROOT /opt/homebrew/bin/go
set -xg GOPATH $HOME/go

# catppuccino-mocha
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='eza --git --group-directories-first --icons'
alias cat='bat'
