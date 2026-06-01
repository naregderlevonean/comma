local M = {}

function M.start(name, callback)
    local target = name or ""
    return function()
        local active = hl.get_active_special_workspace() ~= nil
        
        if not active then
            hl.dispatch(hl.dsp.workspace.toggle_special(target))
            if callback then callback() end
        end
    end
end

function M.stop(callback)
    return function()
        local active = hl.get_active_special_workspace() ~= nil
        
        if active then
            hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
            if callback then callback() end
        end
    end
end

function M.toggle(name, callbacks)
    local target = name or ""
    
    return function()
        local active = hl.get_active_special_workspace() ~= nil

        local start, stop
        if type(callbacks) == "table" then
            start = callbacks.start
            stop = callbacks.stop
        elseif type(callbacks) == "function" then
            start = callbacks
            stop = callbacks
        end

        if active then
            hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
            if stop then stop() end
        else
            hl.dispatch(hl.dsp.workspace.toggle_special(target))
            if start then start() end
        end
    end
end

return M
