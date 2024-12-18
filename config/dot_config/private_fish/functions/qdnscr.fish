function qdnscr --description 'Querying CNAME records.'
    # Set color for the header text
    set_color yellow
    echo "Querying CNAME Records."

    # Reset color to normal
    set_color normal

    # Run the dig command with the provided arguments for CNAME records
    command dig +nocmd $argv cname +noall +answer
end
