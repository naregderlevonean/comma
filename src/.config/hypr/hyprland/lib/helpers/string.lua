local M = {}

function M.escape(s)
    if not s then return "''" end
    return "'" .. string.gsub(tostring(s), "'", "'\\''") .. "'"
end

function M.trim(s)
    if not s then return "" end
    return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

return M

