function disk-cleanup --description 'Show reclaimable cache usage and clean the picked ones'
    argparse l/list h/help -- $argv
    or return

    if set -q _flag_help
        echo "Usage: disk-cleanup [options]"
        echo ""
        echo "Options:"
        echo "  -l, --list   Only print usage, do not offer cleanup"
        echo "  -h, --help   Show this help"
        return 0
    end

    set -l pnpm_stale
    if command -q pnpm
        set -l current (pnpm store path 2>/dev/null)
        for d in (path dirname -- $current)/v*
            test "$d" != "$current"; and set -a pnpm_stale $d
        end
    end

    # name, cleanup command, paths measured for the size column
    set -l targets \
        "homebrew|brew cleanup --prune=all|$HOME/Library/Caches/Homebrew" \
        "uv|uv cache clean|$HOME/.cache/uv" \
        "pnpm-stale|rm -rf $pnpm_stale|"(string join : -- $pnpm_stale) \
        "pnpm|pnpm store prune|"(pnpm store path 2>/dev/null) \
        "npm|npm cache clean --force|$HOME/.npm/_cacache" \
        "npx|rm -rf $HOME/.npm/_npx|$HOME/.npm/_npx" \
        "go|go clean -modcache|$HOME/go/pkg/mod" \
        "mise|mise prune --tools|$HOME/.local/share/mise/installs" \
        "docker|docker system prune -a -f|$HOME/Library/Group Containers/HUAQ24HBR6.dev.orbstack" \
        "playwright|rm -rf $HOME/Library/Caches/ms-playwright|$HOME/Library/Caches/ms-playwright" \
        "node-gyp|rm -rf $HOME/Library/Caches/node-gyp|$HOME/Library/Caches/node-gyp"

    df -h / | tail -1 | read -l -- fs size used avail rest
    echo "disk: $used used of $size, $avail free"
    echo

    set -l rows
    for t in $targets
        set -l f (string split -m2 '|' -- $t)
        set -l paths (string split : -- $f[3] | path filter)
        test (count $paths) -eq 0; and continue
        set -l kb (du -sk $paths 2>/dev/null | awk '{s += $1} END {print s + 0}')
        test $kb -eq 0; and continue
        set -a rows (printf '%s\t%s\t%s\t%s' $kb (__disk_cleanup_human $kb) $f[1] $f[2])
    end

    if test (count $rows) -eq 0
        echo "nothing to clean"
        return 0
    end

    set rows (printf '%s\n' $rows | sort -t\t -k1,1 -rn)
    printf '%s\n' $rows | awk -F'\t' '{printf "%8s  %-11s %s\n", $2, $3, $4}'

    set -q _flag_list; and return 0

    echo
    set -l picked (printf '%s\n' $rows | fzf --multi --delimiter='\t' --with-nth=2,3 \
        --header='TAB to pick, ENTER to confirm' --preview='echo {4}' --preview-window=down,1)
    test (count $picked) -eq 0; and return 0

    echo "will run:"
    for p in $picked
        echo "  "(string split \t -- $p)[4]
    end
    read -l -P 'proceed? [y/N] ' answer
    string match -qi y -- $answer; or return 0

    for p in $picked
        set -l cmd (string split \t -- $p)[4]
        echo "==> $cmd"
        eval $cmd
    end

    echo
    df -h / | tail -1 | read -l -- fs size used avail rest
    echo "now $avail free"
end

function __disk_cleanup_human --argument-names kb
    if test $kb -ge 1048576
        printf '%.1fG' (math $kb / 1048576)
    else if test $kb -ge 1024
        printf '%dM' (math -s0 $kb / 1024)
    else
        printf '%dK' $kb
    end
end
