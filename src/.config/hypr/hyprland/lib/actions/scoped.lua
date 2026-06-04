local M = {}

function M.workspace(action, config)
	if not config then
		return function()
			if not hl.get_active_special_workspace() then
				hl.dispatch(action)
			end
		end
	end

	if config.exclude then
		if type(config.exclude) == "table" then
			local map = {}
			for _, name in ipairs(config.exclude) do
				map[name] = true
			end
			return function()
				local current = hl.get_active_special_workspace()
				local name = current and current.name or ""
				if not map[name] then
					hl.dispatch(action)
				end
			end
		else
			local target = config.exclude
			return function()
				local current = hl.get_active_special_workspace()
				local name = current and current.name or ""
				if name ~= target then
					hl.dispatch(action)
				end
			end
		end
	end

	if type(config.special) == "table" then
		local map = {}
		for _, name in ipairs(config.special) do
			map[name] = true
		end
		return function()
			local current = hl.get_active_special_workspace()
			if current and map[current.name] then
				hl.dispatch(action)
			end
		end
	end

	local target = not not config.special
	return function()
		local current = hl.get_active_special_workspace()
		if (current ~= nil) == target then
			hl.dispatch(action)
		end
	end
end

return M
