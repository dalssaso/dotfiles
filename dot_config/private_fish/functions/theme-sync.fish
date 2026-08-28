function theme-sync --description 'Point every themed tool at the Kanagawa variant for the current appearance'
    set -l variant $argv[1]

    if test -z "$variant"
        if test (defaults read -g AppleInterfaceStyle 2>/dev/null) = Dark
            set variant dark
        else
            set variant light
        end
    end

    set -l pal
    switch $variant
        case dark Dark
            set pal dragon
        case light Light
            set pal lotus
        case '*'
            echo "theme-sync: unknown appearance '$variant'" >&2
            return 1
    end

    set -Ux STARSHIP_CONFIG ~/.config/starship-$pal.toml
    set -Ux EZA_CONFIG_DIR ~/.config/eza-$pal
    set -Ux __theme_btm_config ~/.config/bottom/bottom-$pal.toml

    set -l skins ~/Library/Application\ Support/k9s/skins
    if test -d "$skins"
        ln -sfn kanagawa-$pal.yaml $skins/kanagawa.yaml
    end

    set -l bg dark
    if test $pal = lotus
        set bg light
    end

    for sock in $TMPDIR/nvim.$USER/*/nvim.*.0
        test -S $sock; or continue
        nvim --server $sock --remote-expr "execute('set background=$bg | colorscheme kanagawa')" >/dev/null 2>&1
    end

    return 0
end
