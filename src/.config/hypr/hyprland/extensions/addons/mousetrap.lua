local addon = require("hyprland.extensions.addons.mousetrap.init").setup({
	trigger = {
		fire = false,
	},
	geometry = {
		default = {
			corner = 2,
			edge = 2,
		},
	},
})

-- Workspace

addon.bind("right", function()
	hl.bind("mouse_up", actions.scoped.workspace(actions.workspace.focus("prev")))
	hl.bind("mouse_down", actions.scoped.workspace(actions.workspace.focus("next")))
end, {
	delay = 200,
})

addon.bind("right", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

-- Window

addon.bind("left", actions.window.fit(), {
	delay = 300,
})

addon.bind("bottom", function()
	hl.bind("mouse_up", actions.window.focus("l"))
	hl.bind("mouse_down", actions.window.focus("r"))
end, {
	delay = 200,
})

addon.bind("bottom", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

addons.mousetrap = addon
