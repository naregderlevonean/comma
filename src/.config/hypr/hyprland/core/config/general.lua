hl.config({
	general = {
		allow_tearing = false,
		border_size = 1,
		extend_border_grab_area = 15,
		float_gaps = 24,
		gaps_in = 6,
		gaps_out = 24,
		gaps_workspaces = 128,
		hover_icon_on_border = true,
		layout = "scrolling",
		locale = "",
		modal_parent_blocking = true,
		no_focus_fallback = false,
		resize_corner = 0,
		resize_on_border = false,
	},
})

require("hyprland.core.config.general.col")
require("hyprland.core.config.general.snap")
