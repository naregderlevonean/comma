local function blur()
	local state = hl.get_config("decoration.blur.enabled")

	hl.config({
		decoration = {
			blur = {
				enabled = not state,
			},
		},
	})
end

local function opacity()
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
				active_opacity = 0.96,
				fullscreen_opacity = 0.96,
				inactive_opacity = 0.84,
			},
		})
	end
end

hl.bind("SUPER + CTRL + B", blur)
hl.bind("SUPER + CTRL + O", opacity)
