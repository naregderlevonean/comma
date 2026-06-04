hl.config({
	decoration = {
		active_opacity = 1.00,
		border_part_of_window = false,
		dim_around = 0.92,
		dim_inactive = false,
		dim_modal = true,
		dim_special = 0.00,
		dim_strength = 1.00,
		fullscreen_opacity = 1.00,
		inactive_opacity = 0.90,
		rounding = 20,
		rounding_power = 10.0,
		screen_shader = SHADERS .. "/vivid.glsl",
	},
})

require("hyprland.core.config.decoration.blur")
require("hyprland.core.config.decoration.glow")
require("hyprland.core.config.decoration.shadow")
