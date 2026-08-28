function btm --wraps btm --description 'btm with the current appearance theme'
    set -l cfg $__theme_btm_config
    if test -z "$cfg"; or not test -r "$cfg"
        set cfg ~/.config/bottom/bottom-dark.toml
    end
    command btm -C $cfg $argv
end
