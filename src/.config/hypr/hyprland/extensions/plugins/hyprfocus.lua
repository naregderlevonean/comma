hl.config({
	plugin = {
		hyprfocus = {
			animate_floating = true,
			enabled = true,
			keyboard_focus_animation = "slide",
			mode = "slide",
			mouse_focus_animation = "slide",
			slide_height = 4,
		},
	},
})

hl.animation({
	leaf = "hyprfocusIn",
	enabled = true,
	speed = 2,
	bezier = "linear",
})

hl.animation({
	leaf = "hyprfocusOut",
	enabled = true,
	speed = 2,
	bezier = "linear",
})
