if test -d /opt/homebrew/bin
    set -p PATH $PATH /opt/homebrew/bin
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

if test "$TERM" = xterm-kitty
    alias ssh="kitty +kitten ssh"
end

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

set -gx PATH $PATH $HOME/.krew/bin

if test -f $HOME/.asdf/asdf.fish
    source $HOME/.asdf/asdf.fish
end


# Disable greeting message
set fish_greeting

set -xg BAT_THEME Catppuccin-mocha
set -xg EDITOR nvim
set -xg LS_COLORS (vivid generate catppuccin-mocha)

# catppuccin-frappe
# set -xg FZF_DEFAULT_OPTS "\
# --color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
# --color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
# --color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# tokyonight
set -xg FZF_DEFAULT_OPTS "\
--color=fg:#c0caf5,bg:#1a1b26,hl:#ff9e64 \
--color=fg+:#c0caf5,bg+:#1a1b26,hl+:#ff9e64 \
--color=info:#7aa2f7,prompt:#7aa2f7,pointer:#db4b4b \
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

# catppuccin-mocha
set -Ux FZF_DEFAULT_OPTS "\
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias vim='nvim'
alias v='nvim'
alias vi='nvim'

alias ls='exa --git --group-directories-first --icons'
alias cat='bat'
# alias docker='podman'
