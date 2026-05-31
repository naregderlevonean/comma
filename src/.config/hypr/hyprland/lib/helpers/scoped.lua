local M = {}

local function table_contains(tbl, value)
    if not tbl then return false end
    for _, val in ipairs(tbl) do
        if val == value then
            return true
        end
    end
    return false
end

function M.workspace(action, config)
    config = config or { special = false }

    return function()
        local special = hl.get_active_special_workspace()
        local isActive = special ~= nil
        local name = isActive and special.name or ""

        local allowed = false

        if config.exclude then
            if type(config.exclude) == "table" then
                allowed = not table_contains(config.exclude, name)
            else
                allowed = (name ~= config.exclude)
            end

        elseif type(config.special) == "table" then
            if isActive then
                allowed = table_contains(config.special, name)
            end
            
        else
            allowed = (isActive == config.special)
        end

        if allowed then
            hl.dispatch(action)
        end
    end
end

return M

