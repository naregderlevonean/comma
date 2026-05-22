local M = {}

function M.status(process)
    local name = process:match("%S+")
    local handle = io.popen("pgrep -x " .. name)
    if not handle then return false end
    
    local result = handle:read("*a")
    handle:close()
    
    return result ~= nil and result ~= ""
end

function M.start(process)
    if M.status(process) then return end
    hl.exec_cmd(process .. " > /dev/null 2>&1 &")
end

function M.stop(process)
    local name = process:match("%S+")
    hl.exec_cmd("killall -9 " .. name .. " 2>/dev/null")
end

function M.toggle(process)
    if M.status(process) then
        M.stop(process)
    else
        M.start(process)
    end
end

return M

