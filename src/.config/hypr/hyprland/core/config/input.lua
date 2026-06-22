hl.config({
	input = {
		accel_profile = "adaptive",
		emulate_discrete_scroll = 1,
		float_switch_override_focus = 1,
		focus_on_close = 0,
		follow_mouse = 0,
		follow_mouse_shrink = 0,
		follow_mouse_threshold = 0.0,
		force_no_accel = false,
		kb_file = "",
		kb_layout = "us,ru",
		kb_model = "",
		kb_options = "grp:caps_toggle",
		kb_rules = "",
		kb_variant = "",
		left_handed = false,
		mouse_refocus = true,
		natural_scroll = false,
		numlock_by_default = false,
		off_window_axis_events = 1,
		repeat_delay = 300,
		repeat_rate = 30,
		resolve_binds_by_sym = false,
		rotation = 0,
		scroll_button = 274,
		scroll_button_lock = true,
		scroll_factor = 1.0,
		scroll_method = "on_button_down",
		scroll_points = "",
		sensitivity = 0.0,
		special_fallthrough = false,
	},
})

require("hyprland.core.config.input.tablet")
require("hyprland.core.config.input.touchdevice")
require("hyprland.core.config.input.touchpad")
require("hyprland.core.config.input.virtualkeyboard")
