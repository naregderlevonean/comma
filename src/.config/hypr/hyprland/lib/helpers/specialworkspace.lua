local M = {}

function M.start(name)
    name = name or ""
    return function()
        local is_active = hl.get_active_special_workspace() ~= nil
        
        components.walker.stop()
        
        if not is_active then
            hl.dispatch(hl.dsp.workspace.toggle_special(name))
            components.waybar.stop()()
        end
    end
end

function M.stop()
    return function()
        local is_active = hl.get_active_special_workspace() ~= nil
        
        components.walker.stop()
        
        if is_active then
            hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
            components.waybar.start()()
        end
    end
end

function M.toggle(name)
    name = name or ""
    return function()
        local is_active = hl.get_active_special_workspace() ~= nil

        if is_active then
            M.stop()()
        else
            M.start(name)()
        end
    end
end

return M


