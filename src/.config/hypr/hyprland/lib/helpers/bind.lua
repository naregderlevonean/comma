local M = {}

local function get_system_time()
    local f = io.open("/proc/uptime", "r")
    if f then
        local content = f:read("*a")
        f:close()
        return tonumber(content:match("^(%d+%.%d+)")) or 0
    end
    return 0
end

function M.double(action, delay_ms)
    local max_delay = (delay_ms or 500) / 1000
    local last_time = 0 

    return function()
        local now = get_system_time()
        local diff = now - last_time

        if diff < max_delay and diff > 0.02 then
            last_time = 0
            
            if type(action) == "function" then
                action()
            else
                hl.dispatch(action)
            end
        else
            last_time = now
        end
    end
end

return M

