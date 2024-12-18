function qdnsmr --description 'Querying MX records.'
    # Set color for the header text
    set_color yellow
    echo "Querying MX Records."

    # Reset color to normal
    set_color normal

    # Run the dig command with the provided arguments for MX records
    command dig +nocmd $argv mx +noall +answer
end
