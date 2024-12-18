function flushdns --description 'Flushes macOS DNS cache.'
    # Flush DNS cache
    sudo dscacheutil -flushcache
    sudo killall -HUP mDNSResponder

    # Notify user of success
    say "DNS cleared successfully!"
end
