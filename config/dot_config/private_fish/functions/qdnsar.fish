function qdnsar --description 'Querying A records.'
    # Set color for the header text
    set_color yellow
    echo "Querying A records."

    # Reset color to normal
    set_color normal

    # Run the dig command with the provided arguments for A records
    command dig +nocmd $argv a +noall +answer
end
