local M = {}

function M.init()
	return function()
		local list = hl.get_windows()
		if not list then
			return
		end

		for _, item in ipairs(list) do
			if item.address then
				if not string.match(item.workspace.name, "^special:") then
					hl.dispatch(hl.dsp.window.close({ window = "address:" .. item.address }))
				end
			end
		end
	end
end

return M
