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

# Disable greeting message
set fish_greeting

set -xg BAT_THEME_DARK tokyonight_night
set -xg BAT_THEME_LIGHT tokyonight_day
# Emacs as default editor - opens floating frame for git commits etc.
# Frame closes automatically when editing is done (C-c C-c or save+quit)
set -xg EDITOR "emacsclient -c -a '' -F '((name . \"Editor\") (width . 80) (height . 25))'"
# set -xg LS_COLORS (vivid generate catppuccin-mocha)  # Disabled: using eza theme.yml
set -xg VISUAL $EDITOR
set -xg GOPATH $HOME/go
set -xg GPG_TTY (tty)

set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#283457,bg:#16161e,spinner:#ff007c,hl:#2ac3de \
--color=fg:#c0caf5,header:#ff9e64,info:#545c7e,pointer:#ff007c \
--color=marker:#ff007c,fg+:#c0caf5,prompt:#7aa2f7,hl+:#2ac3de \
--color=selected-bg:#283457 \
--color=border:#27a1b9,label:#c0caf5"

alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='eza --git --group-directories-first --icons'
alias cat='bat'
alias htop='btm'
alias cd='z'
alias kubectl='kubecolor'

# Open project in Emacs workspace
function eproj --description "Open project in Emacs workspace"
    set -l dir (test -n "$argv[1]" && echo "$argv[1]" || pwd)
    set -l abs_dir (realpath "$dir")
    emacsclient -n -e "(hd/open-project-in-workspace \"$abs_dir\")"
end

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# pnpm
set -gx PNPM_HOME "/Users/dalssaso/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /Users/dalssaso/.lmstudio/bin
# End of LM Studio CLI section

