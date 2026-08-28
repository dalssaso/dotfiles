function theme-doctor --description 'Report the resolved theme of every themed tool'
    set -l expected dragon
    set -l style (defaults read -g AppleInterfaceStyle 2>/dev/null)
    if test "$style" != Dark
        set expected lotus
    end
    echo "system appearance expects: $expected"
    echo

    printf '%-10s %s\n' ghostty (ghostty +show-config | string match -r '^theme\s*=.*')
    printf '%-10s %s\n' bat "$BAT_THEME_DARK / $BAT_THEME_LIGHT"

    if set -q STARSHIP_CONFIG
        printf '%-10s %s\n' starship (basename "$STARSHIP_CONFIG")
    else
        printf '%-10s %s\n' starship 'STARSHIP_CONFIG unset'
    end

    if set -q EZA_CONFIG_DIR
        printf '%-10s %s\n' eza (basename "$EZA_CONFIG_DIR")
    else
        printf '%-10s %s\n' eza 'EZA_CONFIG_DIR unset'
    end

    if set -q __theme_btm_config
        printf '%-10s %s\n' bottom (basename "$__theme_btm_config")
    else
        printf '%-10s %s\n' bottom '__theme_btm_config unset'
    end

    if set -q FZF_DEFAULT_OPTS_FILE
        printf '%-10s %s\n' fzf (basename "$FZF_DEFAULT_OPTS_FILE")
    else
        printf '%-10s %s\n' fzf 'FZF_DEFAULT_OPTS_FILE unset'
    end

    set -l k9s_skin ~/Library/Application\ Support/k9s/skins/kanagawa.yaml
    if test -L "$k9s_skin"
        printf '%-10s %s\n' k9s (readlink "$k9s_skin")
    else
        printf '%-10s %s\n' k9s 'kanagawa.yaml symlink missing'
    end

    printf '%-10s %s\n' nvim (nvim --headless -c 'lua io.write(vim.g.colors_name.." "..vim.o.background)' -c q 2>&1)

    if pgrep -q -f 'emacs.*daemon'
        printf '%-10s %s\n' doom (emacsclient -e 'doom-theme' 2>/dev/null)
    else
        printf '%-10s %s\n' doom 'daemon not running'
    end

    echo
    echo "every line above must name '$expected' (ghostty names both; nvim names dark/light)"
end
