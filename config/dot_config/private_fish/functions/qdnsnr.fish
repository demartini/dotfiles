function qdnsnr --description 'Querying NS records.'
    # Set color for the header text
    set_color yellow
    echo "Querying NS Records."

    # Reset color to normal
    set_color normal

    # Run the dig command with the provided arguments for NS records
    command dig +nocmd $argv ns +noall +answer
end
