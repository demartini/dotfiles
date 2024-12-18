function pubkey --description 'Copy SSH public key.'
    if test -f ~/.ssh/id_rsa.pub
        pbcopy <"$HOME"/.ssh/id_rsa.pub && echo "=> Public key copied to clipboard."
    else if test -f ~/.ssh/id_ed25519.pub
        pbcopy <"$HOME"/.ssh/id_ed25519.pub && echo "=> Public key copied to clipboard."
    else
        echo 'No public key found.'
    end
end
