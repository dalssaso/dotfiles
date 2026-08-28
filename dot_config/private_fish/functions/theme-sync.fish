function theme-sync --description 'Point every themed tool at the Ayu variant for the current appearance'
    set -l variant $argv[1]

    if test -z "$variant"
        set -l style (defaults read -g AppleInterfaceStyle 2>/dev/null)
        if test "$style" = Dark
            set variant dark
        else
            set variant light
        end
    end

    switch $variant
        case Dark
            set variant dark
        case Light
            set variant light
        case dark light
            # already normalised
        case '*'
            echo "theme-sync: unknown appearance '$variant'" >&2
            return 1
    end

    # An inherited copy of these lands in global scope, and a global
    # shadows a universal, so drop any global before setting it.
    for var in STARSHIP_CONFIG EZA_CONFIG_DIR __theme_btm_config FZF_DEFAULT_OPTS_FILE
        set -e -g $var 2>/dev/null; or true
    end

    set -Ux STARSHIP_CONFIG ~/.config/starship-$variant.toml
    set -Ux EZA_CONFIG_DIR ~/.config/eza-$variant
    set -Ux __theme_btm_config ~/.config/bottom/bottom-$variant.toml
    set -Ux FZF_DEFAULT_OPTS_FILE ~/.config/fzf-$variant.conf

    set -l skins ~/Library/Application\ Support/k9s/skins
    if test -d "$skins"
        ln -sfn ayu-$variant.yaml $skins/ayu.yaml
    end

    for sock in $TMPDIR/nvim.$USER/*/nvim.*.0
        test -S "$sock"; or continue
        timeout 2 nvim --server "$sock" --remote-expr "execute('set background=$variant | colorscheme ayu')" >/dev/null 2>&1
    end

    return 0
end
