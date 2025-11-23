if status is-interactive
    zoxide init fish | source
end

if status is-interactive
    mise activate fish | source
else
    mise activate fish --shims | source
end

# Old commands are not shown with full prompt
function starship_transient_prompt_func
    starship module character
end
starship init fish | source
enable_transience

fish_add_path -U /opt/homebrew/bin

if test -d $HOME/.bin
    fish_add_path -Ua $HOME/.bin
end

if test -d /opt/homebrew/opt/gnupg@2.2/bin
    fish_add_path -Ua /opt/homebrew/opt/gnupg@2.2/bin
end

if test -d $HOME/.local/bin
    fish_add_path -Ua $HOME/.local/bin
end

if test -d $HOME/.cargo/bin
    fish_add_path -Ua $HOME/.cargo/bin
end

if test -d /opt/homebrew/opt/python@3.12/libexec/bin
    fish_add_path -Ua /opt/homebrew/opt/python@3.12/libexec/bin
end

if test -d /opt/homebrew/opt/grep/libexec/gnubin
    fish_add_path -Ua /opt/homebrew/opt/grep/libexec/gnubin
end

if test -d /opt/homebrew/opt/binutils/bin
    fish_add_path -Ua /opt/homebrew/opt/binutils/bin
end

if test -d /opt/homebrew/opt/coreutils/libexec/gnubin
    fish_add_path -Ua /opt/homebrew/opt/coreutils/libexec/gnubin
end

if test -d /opt/homebrew/opt/gnu-sed/libexec/gnubin
    fish_add_path -Ua /opt/homebrew/opt/gnu-sed/libexec/gnubin
end

if test -d /opt/homebrew/opt/postgresql@16/bin
    set -g LDFLAGS "-L/opt/homebrew/opt/postgresql@16/lib"
    set -g CPPFLAGS "-I/opt/homebrew/opt/postgresql@16/include"
    fish_add_path -Ua /opt/homebrew/opt/postgresql@16/bin
end

if test -d $HOME/.krew/bin
    fish_add_path -Ua $HOME/.krew/bin
end

if test -d $HOME/go/bin
    fish_add_path -Ua $HOME/go/bin
end

if test -d /opt/homebrew/opt/rustup/bin
    fish_add_path -Ua /opt/homebrew/opt/rustup/bin
end

if test -d $HOME/.config/emacs/bin
    fish_add_path -Ua $HOME/.config/emacs/bin
end

if test -d $HOME/.lmstudio/bin
    fish_add_path -Ua $HOME/.lmstudio/bin
end

varclear PATH

#if test -f $HOME/.asdf/asdf.fish
#    source $HOME/.asdf/asdf.fish
#end

# Disable greeting message
set fish_greeting

set -xg BAT_THEME_DARK Catppuccin Mocha
set -xg BAT_THEME_LIGHT Catppuccin Latte
set -xg EDITOR nvim
set -xg LS_COLORS (vivid generate catppuccin-mocha)
set -xg VISUAL nvim
set -xg ZK_NOTEBOOK_DIR $HOME/Dropbox/zk
set -xg GOPATH $HOME/go
set -xg PIPX_HOME $HOME/.local/share/pipx
set -xg GPG_TTY (tty)

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4"

alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='eza --git --group-directories-first --icons'
alias cat='bat'

# Added by Windsurf
fish_add_path /Users/henrique.dalssaso/.codeium/windsurf/bin

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
