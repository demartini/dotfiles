function h --description 'Display last 50 commands with timestamps.'
    builtin history search -R -50 --show-time="%a %d/%m %R "
end
