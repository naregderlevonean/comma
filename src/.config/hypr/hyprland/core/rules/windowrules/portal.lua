hl.window_rule({
	name = "portal",
	match = { class = "xdg-desktop-portal-gtk" },
	float = false,
})

hl.window_rule({
	name = "special-portal",
	match = {
		class = "xdg-desktop-portal-gtk",
		workspace = "special:stylus",
	},
	no_anim = true,
	["hyprbars:no_bar"] = true,
})
