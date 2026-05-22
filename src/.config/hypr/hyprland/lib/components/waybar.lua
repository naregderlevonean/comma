local M = {}

local process = "waybar"

function M.start()
    return function()
        helpers.process.start(process)
    end
end

function M.stop()
    return function()
        helpers.process.stop(process)
    end
end

function M.toggle()
    return function()
        helpers.process.toggle(process)
    end
end

return M

