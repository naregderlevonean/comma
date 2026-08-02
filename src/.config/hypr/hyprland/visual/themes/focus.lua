local M = {}

function M.init()
	hl.dispatch(components.waybar.start())
	hl.config({
		general = {
			layout = "monocle",
		},
	})
end

return M
