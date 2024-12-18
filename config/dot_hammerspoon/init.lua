-- init.lua: Main Hammerspoon configuration

-- Reload Configuration
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()

-- Dropbox Ignore
hs.loadSpoon("DropboxIgnore")
local DropboxIgnore = spoon.DropboxIgnore:new()
DropboxIgnore:start()
