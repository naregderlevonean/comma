hl.config({
	general = {
		allow_tearing = false,
		border_size = 1,
		extend_border_grab_area = 15,
		float_gaps = 24,
		gaps_in = {
			bottom = 16,
			left = 0,
			right = 16,
			top = 0,
		},
		gaps_out = {
			bottom = 16,
			left = 16,
			right = 16,
			top = 16,
		},
		gaps_workspaces = 800,
		hover_icon_on_border = true,
		layout = "scrolling",
		locale = "",
		modal_parent_blocking = true,
		no_focus_fallback = true,
		resize_corner = 0,
		resize_on_border = false,
	},
})

require("hyprland.core.config.general.col")
require("hyprland.core.config.general.snap")
