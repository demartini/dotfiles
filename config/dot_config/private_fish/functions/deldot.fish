function deldot --description 'Remove all macOS generated files that start with ._'
    if type -q fd
        echo "🔍 Searching for files starting with ._ to remove..."
        set files (sudo fd '^\._' --type file --hidden)
        if test (count $files) -eq 0
            echo "🚫 No files starting with ._ found."
        else
            for file in $files
                echo "🗑️ Removing $file"
                sudo rm "$file"
            end
            echo "✅ All ._ files removed!"
        end
    else
        echo "🔍 Searching for files starting with ._ to remove..."
        set files (sudo find . -type f -name '._*')
        if test (count $files) -eq 0
            echo "🚫 No files starting with ._ found."
        else
            for file in $files
                echo "🗑️ Removing $file"
                sudo rm -v "$file"
            end
            echo "✅ All ._ files removed!"
        end
    end
end
