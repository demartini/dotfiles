--- === Dropbox Ignore ===
---
--- Automatically ignores specified files and directories in Dropbox to prevent unwanted syncing using Hammerspoon.
---
--- Download: https://github.com/demartini/DropboxIgnore.spoon
---
local obj = {}
obj.__index = obj

-- Metadata
obj.name = "DropboxIgnore"
obj.version = "1.0"
obj.author = "Iolar Demartini Junior <iolardemartini@gmail.com>"
obj.homepage = "https://github.com/demartini/DropboxIgnore.spoon"
obj.license = "MIT - https://opensource.org/licenses/MIT"

-- Logger setup for debugging
local logger = hs.logger.new("Dropbox Ignore", "debug")

-- Internal function used to find our location, so we know where to load files from
  local function script_path()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
end
obj.spoonPath = script_path()

-- Default configuration loaded from external config.lua
local config = dofile(obj.spoonPath.."/config/config.lua")

obj.target = config.target
obj.ignore = config.ignore
obj.ignoreParent = config.ignoreParent

-- Import Git and XAttr helpers
local git = dofile(obj.spoonPath.."/git.lua")
local xattr = dofile(obj.spoonPath.."/xattr.lua")

--- Creates a new instance of DropboxIgnore.
-- This method allows the creation of a new DropboxIgnore object with custom configurations.
-- If no parameters are provided, it falls back to the default values defined in the module.
-- @param target string? The directory to watch for changes. Defaults to the value of `self.target`.
-- @param ignore table<string, boolean|function>? A table defining files or directories to ignore. Defaults to `self.ignore`.
--        The table can contain:
--        - `true`: to always ignore the file/directory.
--        - `function(path: string): boolean`: A custom function that returns `true` to ignore or `false` otherwise.
-- @param ignoreParent table<string, boolean|function>? A table defining parent directories to ignore. Defaults to `self.ignoreParent`.
--        - Similar to `ignore`, but applies to the parent of the matched file/directory.
-- @return table The newly created DropboxIgnore instance.
function obj:new(target, ignore, ignoreParent)
    local instance = {}
    setmetatable(instance, self)
    self.__index = self

    instance.target = target or self.target
    instance.ignore = ignore or self.ignore
    instance.ignoreParent = ignoreParent or self.ignoreParent

    return instance
end

--- Start the DropboxIgnore directory watcher.
-- Initializes the `hs.pathwatcher` to monitor the specified target directory for changes.
-- On detecting changes, the `changeHandler` is called to process them.
-- @return self Returns the instance of DropboxIgnore for chaining.
function obj:start()
    logger.i("Starting Dropbox Ignore")
    obj.watcher = hs.pathwatcher.new(self.target, function(paths, flagTables)
        self:changeHandler(paths, flagTables)
    end):start()

    return self
end

--- Handle changes in the watched path.
-- Processes created or renamed files to determine if they should be marked as ignored by Dropbox.
-- @param paths table A list of paths affected by the change.
-- @param flagTables table A list of change flags corresponding to the paths.
function obj:changeHandler(paths, flagTables)
    local function shouldHandleChange(changes, localPath)
        return obj.fileExists(localPath) and (changes["itemCreated"] or changes["itemRenamed"]) and
                   not changes["itemXattrMod"]
    end

    for i, path in ipairs(paths) do
        local changes = flagTables[i]

        if shouldHandleChange(changes, path) then
            local ignoreFile, ignoreParent = self:shouldBeIgnored(path)

            if ignoreFile then
                logger.i("Setting ignore attribute for file: " .. path)
                xattr.setIgnore(path)
            end

            if ignoreParent then
                local parent = obj.getParent(path)
                logger.i("Setting ignore attribute for parent: " .. parent)
                xattr.setIgnore(parent)
            end
        end
    end
end

--- Check if the file or its parent should be ignored.
-- Determines whether a file or its parent directory matches the ignore criteria defined in `config.lua`.
-- @param path string The path to the file being evaluated.
-- @return boolean ignoreFile, boolean ignoreParent Whether the file or its parent should be ignored by Dropbox.
function obj:shouldBeIgnored(path)
    local ignore = {}
    local file = self.ignore[hs.fs.displayName(path)] or false
    local parent = self.ignoreParent[hs.fs.displayName(path)] or false

    if type(file) == "function" then
        ignore.file = file(path)
    else
        ignore.file = file
    end

    if type(parent) == "function" then
        ignore.parent = parent(path)
    else
        ignore.parent = parent
    end

    if hs.fs.displayName(path) == "vendor" then
        ignore.file = git.isGitIgnored(path)
    end

    return ignore.file, ignore.parent
end

--- Check if a file exists at the given path.
-- @param path string The file path to check.
-- @return boolean `true` if the file exists, `false` otherwise.
function obj.fileExists(path)
    return not not hs.fs.displayName(path)
end

--- Get the parent directory of a given file path.
-- Extracts the parent directory from the provided file path.
-- @param path string The file path for which the parent directory is required.
-- @return string The parent directory path.
function obj.getParent(path)
    return string.match(path, '^(.+)/')
end

return obj
