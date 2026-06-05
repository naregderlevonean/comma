local M = {}

local function workspaces()
	local active = hl.get_active_workspace()
	if not active then
		return nil, {}
	end

	local workspaces = hl.get_workspaces()
	local occupied = {}

	for _, workspace in ipairs(workspaces) do
		if workspace.id > 0 and workspace.monitor == active.monitor then
			table.insert(occupied, workspace.id)
		end
	end

	table.sort(occupied)
	return active.id, occupied
end

function M.blanket(layout, config)
	config = config or {}
	local special = config.specialworkspace or false

	local workspaces = hl.get_workspaces()
	for _, worksapce in ipairs(workspaces) do
		local isspecial = string.find(worksapce.name, "^special:") ~= nil

		if not isspecial or special then
			hl.workspace_rule({
				workspace = worksapce.name,
				layout = layout,
			})
		end
	end
end

function M.compute(direction)
	local current, occupied = workspaces()
	if not current then
		return nil
	end

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

function M.focus(direction)
	return function()
		local target = M.compute(direction)
		if target then
			hl.dispatch(hl.dsp.focus({ workspace = tostring(target) }))
		end
	end
end

function M.layout(name)
	local active = hl.get_active_workspace()

	if active and active.name then
		hl.workspace_rule({
			workspace = active.name,
			layout = name,
		})
	end
end

return M
