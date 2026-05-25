local M = {}

local function workspaces()
    local active = hl.get_active_workspace()
    if not active then return nil, {} end

    local workspaces = hl.get_workspaces()
    local occupied = {}

    for _, workspace in ipairs(workspaces) do
        if workspace.id > 0 then
            table.insert(occupied, workspace.id)
        end
    end

    table.sort(occupied)
    return active.id, occupied
end

local function compute(direction)
    local current, occupied = workspaces()
    if not current then return nil end

    local maximum = occupied[#occupied] or 1
    local target = current

    if direction == "next" then
        for _, workspace in ipairs(occupied) do
            if workspace > current then
                target = workspace
                break
            end
        end
        if target == current and current == maximum then
            target = current + 1
        end

    elseif direction == "prev" then
        for i = #occupied, 1, -1 do
            if occupied[i] < current then
                target = occupied[i]
                break
            end
        end

    elseif direction == "home" then
        target = 1

    elseif direction == "last" then
        target = maximum + 1
    end

    return (target ~= current) and target or nil
end

local function focus(direction)
    return function()
        local target = compute(direction)
        if target then
            hl.dispatch(hl.dsp.focus({ workspace = tostring(target) }))
        end
    end
end

local function movetoworkspace(direction, follow)
    return function()
        local target = compute(direction)
        if target then
            local arguments = { workspace = tostring(target) }
            if follow ~= nil then arguments.follow = follow end
            hl.dispatch(hl.dsp.window.move(arguments))
        end
    end
end

local directions = { "next", "prev", "home", "last" }

for _, direction in ipairs(directions) do
    M[direction] = function() return focus(direction) end
end

for _, direction in ipairs(directions) do
    M["movewindow" .. direction] = function() return movetoworkspace(direction) end
    M["movewindow" .. direction .. "silent"] = function() return movetoworkspace(direction, false) end
end

return M
