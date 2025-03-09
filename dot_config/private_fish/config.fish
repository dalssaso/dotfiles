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


set -xg BAT_THEME_DARK rose-pine-moon
set -xg BAT_THEME_LIGHT rose-pine-dawn
set -xg EDITOR nvim
set -xg LS_COLORS (vivid generate rose-pine-moon)
set -xg VISUAL nvim
set -xg ZK_NOTEBOOK_DIR $HOME/Dropbox/zk
set -xg GOPATH $HOME/go
set -xg PIPX_HOME $HOME/.local/share/pipx

# rose-pine-moon
set -Ux FZF_DEFAULT_OPTS "
	--color=fg:#908caa,bg:#232136,hl:#ea9a97
	--color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
	--color=border:#44415a,header:#3e8fb0,gutter:#232136
	--color=spinner:#f6c177,info:#9ccfd8
	--color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa"

alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='eza --git --group-directories-first --icons'
alias cat='bat'
