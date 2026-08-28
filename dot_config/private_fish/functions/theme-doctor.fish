function theme-doctor --description 'Report the resolved theme of every themed tool'
    set -l expected dark
    set -l style (defaults read -g AppleInterfaceStyle 2>/dev/null)
    if test "$style" != Dark
        set expected light
    end
    echo "system appearance expects: $expected"
    echo

    printf '%-10s %s\n' ghostty (ghostty +show-config | string match -r '^theme\s*=.*')
    printf '%-10s %s\n' bat "$BAT_THEME_DARK / $BAT_THEME_LIGHT"

    if set -q STARSHIP_CONFIG
        set -l name (basename "$STARSHIP_CONFIG")
        test -f "$STARSHIP_CONFIG"; or set name "$name (MISSING)"
        printf '%-10s %s\n' starship $name
    else
        printf '%-10s %s\n' starship 'STARSHIP_CONFIG unset'
    end

    if set -q EZA_CONFIG_DIR
        set -l name (basename "$EZA_CONFIG_DIR")
        test -d "$EZA_CONFIG_DIR"; or set name "$name (MISSING)"
        printf '%-10s %s\n' eza $name
    else
        printf '%-10s %s\n' eza 'EZA_CONFIG_DIR unset'
    end

    if set -q __theme_btm_config
        set -l name (basename "$__theme_btm_config")
        test -f "$__theme_btm_config"; or set name "$name (MISSING)"
        printf '%-10s %s\n' bottom $name
    else
        printf '%-10s %s\n' bottom '__theme_btm_config unset'
    end

    if set -q FZF_DEFAULT_OPTS_FILE
        set -l name (basename "$FZF_DEFAULT_OPTS_FILE")
        test -f "$FZF_DEFAULT_OPTS_FILE"; or set name "$name (MISSING)"
        printf '%-10s %s\n' fzf $name
    else
        printf '%-10s %s\n' fzf 'FZF_DEFAULT_OPTS_FILE unset'
    end

    set -l k9s_skin ~/Library/Application\ Support/k9s/skins/ayu.yaml
    if test -L "$k9s_skin"
        set -l target (readlink "$k9s_skin")
        test -e "$k9s_skin"; or set target "$target (MISSING)"
        printf '%-10s %s\n' k9s $target
    else
        printf '%-10s %s\n' k9s 'ayu.yaml symlink missing'
    end

    # Probe a RUNNING nvim, not a fresh headless one. A headless nvim has no
    # terminal, so it can never answer OSC 11 and always reports `dark` --
    # which is a false failure in the light variant. Running instances are also what
    # theme-sync actually controls.
    set -l nvim_state "no running instance"
    for sock in $TMPDIR/nvim.$USER/*/nvim.*.0
        test -S "$sock"; or continue
        set nvim_state (timeout 2 nvim --server "$sock" --remote-expr \
            'g:colors_name .. " " .. &background' 2>/dev/null)
        or set nvim_state "unreachable socket"
        break
    end
    printf '%-10s %s\n' nvim $nvim_state

    if pgrep -qif 'emacs.*daemon'   # -i: the process is `Emacs`, capital E
        printf '%-10s %s\n' doom (emacsclient -e 'doom-theme' 2>/dev/null)
    else
        printf '%-10s %s\n' doom 'daemon not running'
    end

    echo
    echo "every line above must reflect '$expected' (ghostty names both; nvim names dark/light;"
    echo "bat and doom show theme display names, not the token -- dark = Mirage, light = Light)"
end
