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

if test -d /opt/homebrew/opt/postgresql@15/bin
    set -g LDFLAGS "-L/opt/homebrew/opt/postgresql@15/lib"
    set -g CPPFLAGS "-I/opt/homebrew/opt/postgresql@15/include"
    fish_add_path -Ua /opt/homebrew/opt/postgresql@15/bin
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

varclear PATH

#if test -f $HOME/.asdf/asdf.fish
#    source $HOME/.asdf/asdf.fish
#end

# Disable greeting message
set fish_greeting

set -xg BAT_THEME_DARK gruvbox-dark
set -xg BAT_THEME_LIGHT gruvbox-light
set -xg EDITOR nvim
set -xg LS_COLORS (vivid generate gruvbox-dark)
set -xg VISUAL nvim
set -xg ZK_NOTEBOOK_DIR $HOME/Dropbox/zk
set -xg GOPATH $HOME/go
set -xg PIPX_HOME $HOME/.local/share/pipx

set -l color00 '#282828'
set -l color01 '#3c3836'
set -l color02 '#504945'
set -l color03 '#665c54'
set -l color04 '#928374'
set -l color05 '#ebdbb2'
set -l color06 '#fbf1c7'
set -l color07 '#f9f5d7'
set -l color08 '#cc241d'
set -l color09 '#d65d0e'
set -l color0A '#d79921'
set -l color0B '#98971a'
set -l color0C '#689d6a'
set -l color0D '#458588'
set -l color0E '#b16286'
set -l color0F '#9d0006'

set -l FZF_NON_COLOR_OPTS

for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
    if not string match -q -- "--color*" $arg
        set -a FZF_NON_COLOR_OPTS $arg
    end
end

set -Ux FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

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
