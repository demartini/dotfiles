function l --description 'List directory contents.'
    if type -q eza
        eza --header --long --git --icons --all --all --links --group $argv
    else
        ls -lha $argv
    end
end
