local M = {}

local nav_handlers = {
    ["scrolling"] = function(dir)
        return hl.dsp.layout(dir == "next" and "move +col" or "move -col")
    end,
    ["dwindle"] = function(dir)
        return hl.dsp.movefocus(dir == "next" and "r" or "l")
    end,
    ["master"] = function(dir)
        return hl.dsp.movefocus(dir == "next" and "r" or "l")
    end,
    ["monocle"] = function(dir)
        return dir == "next" and hl.dsp.layout("cyclenext") or hl.dsp.layout("cycleprev")
    end,
}

function M.navigate(direction)
    return function()
        local layout = tostring(hl.get_config("general:layout"))
        local action_factory = nav_handlers[layout] or nav_handlers["dwindle"]
        
        hl.dispatch(action_factory(direction))
    end
end

function M.float(opts)
    opts = opts or { w = 1200, h = 800 }
    
    return function()
        local window = hl.get_active_window()
        if not window then return end
        
        if window.floating then
            hl.dispatch(hl.dsp.window.float({ action = "disable" }))
        else
            hl.dispatch(hl.dsp.window.float({ action = "enable" }))
            hl.dispatch(hl.dsp.window.resize({ x = opts.w, y = opts.h }))
            hl.dispatch(hl.dsp.window.center())
        end
    end
end

return M

