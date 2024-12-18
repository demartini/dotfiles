--- Configuration for DropboxIgnore Spoon
---
--- This file contains the settings for watching and ignoring files/folders.
---
--- You can adjust the settings according to your needs.
---
local config = {}

-- The directory to watch for changes. By default, this is the Dropbox development directory.
-- Change this path to any directory you want to monitor for ignored files.
config.target = os.getenv('HOME') .. '/Library/CloudStorage/Dropbox/Development/Repositories'

-- A table of files and directories to ignore. Set values to `true` to ignore the files
-- as soon as they are created or renamed. You can also set the value to a function
-- that returns `true` if the file should be ignored based on custom logic.
config.ignore = {
    ['node_modules'] = true, -- Ignore the 'node_modules' directory
    ['.next'] = true, -- Ignore the '.next' directory (Next.js build artifacts)
    ['.git'] = true, -- Ignore Git repository directories
    ['__pycache__'] = true, -- Ignore Python bytecode cache directories
    ['.sass-cache'] = true, -- Ignore SASS cache directories
    ['dist'] = true, -- Ignore build output directories
    ['vendor'] = true -- Ignore vendor directories (non-Git)
}

-- A table of files whose parent directories should be marked as ignored.
-- Files like 'CACHEDIR.TAG' can be used to indicate that their entire parent
-- directory should be excluded from Dropbox syncing.
config.ignoreParent = {
    ['CACHEDIR.TAG'] = true
}

return config
