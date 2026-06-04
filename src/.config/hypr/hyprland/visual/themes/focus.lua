local M = {}

function M.init()
	components.waybar.start()()
	hl.config({
		general = {
			layout = "monocle",
		},
	})
end

return M
