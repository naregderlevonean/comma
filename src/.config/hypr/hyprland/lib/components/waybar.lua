local M = {}

local process = "waybar"

function M.show()
    return function()
        hl.exec_cmd("killall -SIGUSR1 " .. process)
    end
end

function M.hide()
    return function()
        hl.exec_cmd("killall -SIGUSR2 " .. process)
    end
end

function M.start()
    return function()
        system.process.start(process)
    end
end

function M.stop()
    return function()
        system.process.stop(process)
    end
end

function M.toggle()
    return function()
        system.process.toggle(process)
    end
end

return M

