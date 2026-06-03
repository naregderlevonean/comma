local M = {}

local space = require("hyprland.lib.actions.workspace")

local layouts = {
    scrolling = function(dir)
        return hl.dsp.layout(dir == "next" and "move +col" or "move -col")
    end,
    dwindle = function(dir)
        return hl.dsp.focus({ direction = dir == "next" and "r" or "l" })
    end,
    master = function(dir)
        return hl.dsp.focus({ direction = dir == "next" and "r" or "l" })
    end,
    monocle = function(dir)
        return hl.dsp.layout(dir == "next" and "cyclenext" or "cycleprev")
    end,
}

function M.focus(dir)
    return function()
        local active = hl.get_active_special_workspace() or hl.get_active_workspace()
        local current = active and active.tiled_layout or "dwindle"
        local step = layouts[current] or layouts.dwindle

        hl.dispatch(step(dir))
    end
end

function M.move(dir, options)
    local opts = options or {}
    local follow = (opts.follow ~= nil) and opts.follow or false

    return function()
        local target = space.compute(dir)
        
        if target then
            hl.dispatch(hl.dsp.window({
                action = "move",
                workspace = tostring(target),
                follow = follow
            }))
        end
    end
end

function M.stash(options)
    local opts = options or {}
    local target = opts.workspace or "special"
    local follow = (opts.follow ~= nil) and opts.follow or true
    local callback = opts.callback

    return function()
        hl.dispatch(hl.dsp.window({ 
            action = "move",
            workspace = target, 
            follow = follow 
        }))
        
        if type(callback) == "function" then
            callback()
        end
    end
end

function M.float(options)
    local opts = options or { width = 1200, height = 800 }
    
    return function()
        local win = hl.get_active_window()
        if not win then return end
        
        if win.floating then
            hl.dispatch(hl.dsp.window({ action = "togglefloating" }))
        else
            hl.dispatch(hl.dsp.window({ action = "togglefloating" }))
            hl.dispatch(hl.dsp.window({ action = "resize", x = opts.width, y = opts.height }))
            hl.dispatch(hl.dsp.window({ action = "center" }))
        end
    end
end

return M

