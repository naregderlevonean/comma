local M = {}

function M.blanket(layout, config)
	config = config or {}

	local special = config.specialworkspace or false

	for _, workspace in ipairs(hl.get_workspaces()) do
		local isspecial = workspace.name:match("^special:")

		if not isspecial or special then
			hl.workspace_rule({
				workspace = workspace.name,
				layout = layout,
			})
		end
	end
end

function M.compute(direction)
	local active = hl.get_active_workspace()
	if not active then
		return nil
	end

	local current = active.id
	local target

	if direction == "next" then
		target = current < WORKSPACES_LIMIT and current + 1 or nil
	elseif direction == "prev" then
		target = current > 1 and current - 1 or nil
	elseif direction == "home" then
		target = 1
	elseif direction == "last" then
		target = WORKSPACES_LIMIT
	else
		return nil
	end

	return target ~= current and target or nil
end

function M.focus(direction)
	return function()
		local target = M.compute(direction)

		if target then
			hl.dispatch(hl.dsp.focus({
				workspace = tostring(target),
				on_current_monitor = true,
			}))
		end
	end
end

function M.layout(name)
	local active = hl.get_active_workspace()

	if not active or not active.name then
		return
	end

	local target = name

	if not target then
		local current = active.tiled_layout or layouts[1]

		for i, layout in ipairs(layouts) do
			if layout == current then
				target = layouts[(i % #layouts) + 1]
				break
			end
		end

		target = target or layouts[1]
	end

	hl.workspace_rule({
		workspace = active.name,
		layout = target,
	})
end

return M
