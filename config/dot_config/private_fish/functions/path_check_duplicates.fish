function path_check_duplicates --description 'Show duplicated paths in $PATH.'
    if test -z "$PATH"
        echo "PATH is empty or not set."
        return 1
    end

    echo $PATH | tr ':' '\n' | sort | uniq -d | nl
end
