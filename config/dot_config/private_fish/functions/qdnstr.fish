function qdnstr --description 'Querying TXT records.'
    # Set color for the header text
    set_color yellow
    echo "Querying TXT Records."

    # Reset color to normal
    set_color normal

    # Run the dig command with the provided arguments for TXT records
    command dig +nocmd $argv txt +noall +answer
end
