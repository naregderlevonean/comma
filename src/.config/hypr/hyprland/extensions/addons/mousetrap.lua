local addon = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = {
			corner = 2,
			edge = 2,
		},
	},
})

-- Workspace

addon.bind("right", actions.scoped.workspace(actions.workspace.focus("next")), {
	direction = "up",
	distance = 500,
})

addon.bind("right", actions.scoped.workspace(actions.workspace.focus("prev")), {
	direction = "down",
	distance = 500,
})

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

addon.bind("bottom", actions.window.focus("l"), {
	direction = "right",
	distance = 500,
})

addon.bind("bottom", actions.window.focus("r"), {
	direction = "left",
	distance = 500,
})

addon.bind("left", actions.window.fit(), {
	flick = 100,
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
