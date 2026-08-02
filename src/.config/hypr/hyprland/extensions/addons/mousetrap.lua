local addon = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = {
			corner = 2,
			edge = 2,
		},
	},
})

addon.bind("right", actions.scoped.workspace(actions.workspace.focus("next")), {
	direction = "up",
	distance = 300,
	loop = true,
})

addon.bind("right", actions.scoped.workspace(actions.workspace.focus("prev")), {
	direction = "down",
	distance = 300,
	loop = true,
})

addon.bind("bottom", actions.window.focus("r"), {
	direction = "left",
	distance = 300,
	loop = true,
})

addon.bind("bottom", actions.window.focus("l"), {
	direction = "right",
	distance = 300,
	loop = true,
})

addon.bind("left", actions.window.fit(), {
	velocity = 100,
})

addons.mousetrap = addon
