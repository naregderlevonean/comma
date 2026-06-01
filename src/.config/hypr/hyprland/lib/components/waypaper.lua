local M = {}

local function reset()
    hl.exec_cmd("killall mpvpaper hyprpaper waypaper >/dev/null 2>&1")
end

local function play(filename)
    local home = os.getenv("HOME")
    if not home then return end
    
    local target = filename or base.random.file(home .. "/Videos/Wallpapers")
    
    if target then
        local safe_target = base.string.escape(target)
        hl.exec_cmd(string.format("mpvpaper -o '--panscan=1.0 --loop-file=inf' '*' %s >/dev/null 2>&1 &", safe_target))
    end
end

local function apply(selection)
    reset()
    local mode = type(selection) == "table" and selection.type or selection
    
    if mode == "image" then
        hl.exec_cmd("waypaper --random >/dev/null 2>&1 &")
    elseif mode == "video" then
        play()
    end
end

function M.random(selection)
    return function()
        apply(selection)
    end
end

function M.image(filename)
    return function()
        if not filename then return end
        reset()
        hl.exec_cmd(string.format("waypaper --wallpaper %s >/dev/null 2>&1 &", base.string.escape(filename)))
    end
end

function M.video(filename)
    return function()
        if not filename then return end
        reset()
        play(filename)
    end
end

function M.off()
    return reset 
end

return M
