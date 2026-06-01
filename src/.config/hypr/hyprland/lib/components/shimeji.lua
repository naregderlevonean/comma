local M = {}

local process = "shimejictl"
local daemon = "shimeji-overlay"
local arguments = "summon 'Black Bunny'"

function M.start()
    return function()
        system.process.start(string.format("%s %s", process, arguments))
    end
end

function M.stop()
    return function()
        system.process.stop(daemon)
    end
end

function M.toggle()
    return function()
        if system.process.status(daemon) then
            M.stop()()
        else
            M.start()()
        end
    end
end

function M.status()
    return system.process.status(process)
end

return M

