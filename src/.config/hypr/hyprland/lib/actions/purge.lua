local M = {}

function M.init()
	local list = hl.get_windows()
	if not list then
		return
	end

	for _, item in ipairs(list) do
		if item.address then
			hl.dispatch(hl.dsp.window.close({ window = "address:" .. item.address }))
		end
	end
end

return M
