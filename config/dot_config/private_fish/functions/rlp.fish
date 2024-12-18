function rlp --description 'Reset Launchpad Layout.'
    defaults write com.apple.dock ResetLaunchPad -bool true
    killall Dock
end
