local git = {}

--- Checks if a file is inside a Git repository.
-- This function uses the `git status` command to determine if the given file path
-- is within a Git repository. It executes the command within the directory containing the file.
-- @param path string The path to the file or directory to check
-- @return boolean `true` if the file is inside a Git repository, `false` otherwise
function git.isInGitRepo(path)
    local context = getContext(path)
    local _, status = hs.execute(
        string.format([[ /usr/bin/env git -C %q status --porcelain > /dev/null 2>&1 ]], context))

    return status or false
end

--- Checks if a file is ignored by Git.
-- This function uses the `git check-ignore` command to check if the given file path
-- is ignored by Git according to the repository’s `.gitignore` rules.
-- @param path string The path to the file to check
-- @return boolean `true` if the file is ignored by Git, `false` otherwise
function git.isGitIgnored(path)
    local context = getContext(path)
    local _, status = hs.execute(string.format([[ /usr/bin/env git -C %q check-ignore -q %q > /dev/null 2>&1 ]],
        context, path))

    return status or false
end

--- Determines the appropriate context for a given path.
-- If the path is a directory, it returns the path itself. Otherwise, it returns the parent directory.
-- @param path string The path to analyze
-- @return string The context directory for the given path
local function getContext(path)
    if hs.fs.attributes(path, "mode") == "directory" then
        return path
    end

    return string.match(path, "^(.+)/")
end

return git
