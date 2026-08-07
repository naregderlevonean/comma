hl.config({
	decoration = {
		active_opacity = 0.96,
		border_part_of_window = false,
		dim_around = 0.88,
		dim_inactive = false,
		dim_modal = true,
		dim_special = 0.48,
		dim_strength = 0.64,
		fullscreen_opacity = 0.96,
		inactive_opacity = 0.84,
		rounding = 20,
		rounding_power = 10.0,
		screen_shader = SHADERS .. "/vivid.glsl",
	},
})

require("hyprland.core.config.decoration.blur")
require("hyprland.core.config.decoration.glow")
require("hyprland.core.config.decoration.shadow")
