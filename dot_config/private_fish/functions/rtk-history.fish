function rtk-history -d "Query RTK command history from sqlite database"
    set -l db "$HOME/Library/Application Support/rtk/history.db"

    if not test -f "$db"
        echo "RTK history database not found at $db"
        return 1
    end

    argparse 'c/command=' 'n/limit=!_validate_int' 's/sort=' 'h/help' -- $argv
    or return

    if set -q _flag_help
        echo "Usage: rtk-history [options]"
        echo ""
        echo "Options:"
        echo "  -c, --command FILTER   Filter by command (e.g. curl, git)"
        echo "  -n, --limit N          Limit results (default: 50)"
        echo "  -s, --sort FIELD       Sort by: saved (default), count, recent"
        echo "  -h, --help             Show this help"
        return 0
    end

    set -l limit (test -n "$_flag_limit" && echo "$_flag_limit" || echo 50)
    set -l sort_field "total_saved DESC"

    switch "$_flag_sort"
        case count
            set sort_field "cnt DESC"
        case recent
            set sort_field "last_used DESC"
        case '*'
            set sort_field "total_saved DESC"
    end

    set -l where_clause "1=1"
    if set -q _flag_command
        set where_clause "original_cmd LIKE '%$_flag_command%'"
    end

    sqlite3 -header -column "$db" \
        "SELECT original_cmd as command,
                count(*) as cnt,
                sum(saved_tokens) as total_saved,
                max(timestamp) as last_used
         FROM commands
         WHERE $where_clause
         GROUP BY original_cmd
         ORDER BY $sort_field
         LIMIT $limit"
end
