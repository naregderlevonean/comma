local M = {}

local id_to_path = {}
local path_to_id = {}
local current_idx = 0
local total_shaders = 0

local function get_shader_name(path)
    if not path or path == "" then return "None" end
    return path:match("([^/]+)%.glsl$") or "Unknown"
end

local function notify(path)
    local name = get_shader_name(path)
    local cmd = string.format("notify-send -r 9119 -t 1500 'Hyprland' 'Shader: %s' >/dev/null 2>&1 &", helpers.string.escape(name))
    os.execute(cmd)
end

function M.index_shaders()
    id_to_path = {}
    path_to_id = {}
    
    local shaders_dir = os.getenv("SHADERS") or (os.getenv("HOME") .. "/.config/hypr/shaders")
    local cmd = string.format("find %s -maxdepth 1 -name '*.glsl' | sort 2>/dev/null", helpers.string.escape(shaders_dir))
    
    local p = io.popen(cmd)
    if p then
        local idx = 1
        for line in p:lines() do
            local path = line:match("^%s*(.-)%s*$")
            if path and path ~= "" then
                id_to_path[idx] = path
                path_to_id[path] = idx
                idx = idx + 1
            end
        end
        p:close()
    end
    
    total_shaders = #id_to_path
    
    if hl.get_config then
        local active_shader = hl.get_config("decoration:screen_shader")
        current_idx = path_to_id[active_shader] or 0
    else
        current_idx = 0
    end
end

local function apply(idx)
    current_idx = idx
    local path = id_to_path[idx] or ""
    
    hl.config({ decoration = { screen_shader = path } })
    notify(path)
end

local function cycle(step)
    return function()
        if total_shaders == 0 then return end
        
        local next_idx
        if current_idx == 0 then
            next_idx = (step > 0) and 1 or total_shaders
        else
            next_idx = (current_idx - 1 + step) % total_shaders + 1
        end
        
        apply(next_idx)
    end
end

M.next = function() return cycle(1) end
M.prev = function() return cycle(-1) end

function M.off()
    return function()
        if current_idx ~= 0 then apply(0) end
    end
end

M.index_shaders()

return M

