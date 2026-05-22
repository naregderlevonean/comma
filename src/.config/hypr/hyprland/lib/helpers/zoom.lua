local M = {}

local scale = {
    default = 1.5,
    current = 1.5,
    min = 1.0,
    max = 3.0,
    step = 0.5
}

local function set(new_scale)
    if new_scale < scale.min then new_scale = scale.min end
    if new_scale > scale.max then new_scale = scale.max end
    
    new_scale = math.floor(new_scale * 100 + scale.step) / 100
    
    scale.current = new_scale
    
    hl.monitor({
        output = "eDP-1",
        scale = scale.current
    })
end

function M.up()
    return function()
        set(scale.current + scale.step)
    end
end

function M.down()
    return function()
        set(scale.current - scale.step)
    end
end

function M.reset()
    return function()
        set(scale.default)
    end
end

return M

