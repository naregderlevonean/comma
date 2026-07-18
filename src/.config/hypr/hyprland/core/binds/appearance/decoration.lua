hl.bind("SUPER + CTRL + B", function()
	local state = hl.get_config("decoration.blur.enabled")
	hl.config({
		decoration = {
			blur = {
				enabled = not state,
			},
		},
	})
end)

hl.bind("SUPER + CTRL + O", function()
	local state = hl.get_config("decoration.active_opacity")

	if state and state < 1.00 then
		hl.config({
			decoration = {
				active_opacity = 1.00,
				fullscreen_opacity = 1.00,
				inactive_opacity = 1.00,
			},
		})
	else
		hl.config({
			decoration = {
				active_opacity = 0.92,
				fullscreen_opacity = 0.92,
				inactive_opacity = 0.72,
			},
		})
	end
end)
