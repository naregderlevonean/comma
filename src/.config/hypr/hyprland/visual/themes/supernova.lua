local M = {}

function M.init()
	components.waybar.stop()
	hl.config({
		general = {
			layout = "lua:grid",
		},
		decoration = {
			rounding = 24,
			glow = {
				enabled = true,
			},
		},
		scrolling = {
			column_width = 0.800000,
		},
	})
end

return M
