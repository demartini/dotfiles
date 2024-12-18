local xattr = {}

--- Sets the "ignore" extended attribute for a given file.
-- This function checks if the file already has the extended attribute "com.apple.fileprovider.ignore#P" set to 1.
-- If the attribute is not set, it will add the attribute to the file to instruct Dropbox to ignore it.
-- @param path string The file path to which the extended attribute should be applied.
function xattr.setIgnore(path)
    local currentValue = hs.fs.xattr.get(path, "com.apple.fileprovider.ignore#P")
    if not currentValue then
        hs.fs.xattr.set(path, "com.apple.fileprovider.ignore#P", "1")
    end
end

return xattr
