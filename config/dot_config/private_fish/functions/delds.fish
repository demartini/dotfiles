function delds --description 'Remove all .DS_Store files from macOS.'
    if type -q fd
        echo "🔍 Searching for .DS_Store files to remove..."
        set files (sudo fd '^\.DS_Store$' --type file --hidden)
        if test (count $files) -eq 0
            echo "🚫 No .DS_Store files found."
        else
            for file in $files
                echo "🗑️ Removing $file"
                sudo rm "$file"
            end
            echo "✅ All .DS_Store files removed!"
        end
    else
        echo "🔍 Searching for .DS_Store files to remove..."
        set files (sudo find . -type f -name '*.DS_Store')
        if test (count $files) -eq 0
            echo "🚫 No .DS_Store files found."
        else
            for file in $files
                echo "🗑️ Removing $file"
                sudo rm -v "$file"
            end
            echo "✅ All .DS_Store files removed!"
        end
    end
end
