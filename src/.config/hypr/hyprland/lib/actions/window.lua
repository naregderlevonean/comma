local M = {}

local workspace = require("hyprland.lib.actions.workspace")

local actions = {
    ["scrolling"] = function(direction)
        return hl.dsp.layout(direction == "next" and "move +col" or "move -col")
    end,
    ["dwindle"] = function(direction)
        return hl.dsp.movefocus(direction == "next" and "r" or "l")
    end,
    ["master"] = function(direction)
        return hl.dsp.movefocus(direction == "next" and "r" or "l")
    end,
    ["monocle"] = function(direction)
        return direction == "next" and hl.dsp.layout("cyclenext") or hl.dsp.layout("cycleprev")
    end,
}

function M.focus(direction)
    return function()
        local current = hl.get_active_special_workspace() or hl.get_active_workspace()
        local layout = current and current.tiled_layout or "dwindle"
        local action = actions[layout] or actions["dwindle"]

        hl.dispatch(action(direction))
    end
end

function M.move(direction, options)
    local opts = options or {}
    local follow = (opts.follow ~= nil) and opts.follow or false

    return function()
        local target = workspace.compute(direction)
        
        if target then
            hl.dispatch(hl.dsp.window.move({
                workspace = tostring(target),
                follow = follo
            }))
        end
    end
end

function M.stash(options)
    local opts = options or {}
    local target_workspace = opts.workspace or "special"
    local mode = (opts.follow ~= nil) and opts.follow or true
    local callback = opts.callback

    return function()
        hl.dispatch(hl.dsp.window.move({ 
            workspace = target_workspace, 
            follow = mode 
        }))
        
        if type(callback) == "function" then
            callback()
        end
    end
end


function M.float(options)
    local settings = options or { width = 1200, height = 800 }
    
    return function()
        local target = hl.get_active_window()
        if not target then return end
        
        if target.floating then
            hl.dispatch(hl.dsp.window.float({ action = "disable" }))
        else
            hl.dispatch(hl.dsp.window.float({ action = "enable" }))
            hl.dispatch(hl.dsp.window.resize({ x = settings.width, y = settings.height }))
            hl.dispatch(hl.dsp.window.center())
        end
    end
end

return M
