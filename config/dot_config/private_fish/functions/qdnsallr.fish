function qdnsallr --description 'Querying All Records.'
    # Set color for the header text
    set_color yellow
    echo "Querying All Records."

    # Reset color to normal
    set_color normal

    # Run the dig command with the provided arguments
    command dig +nocmd $argv any +noall +answer
end
