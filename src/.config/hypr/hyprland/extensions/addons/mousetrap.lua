local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = { corner = 16, edge = 4 },
	},
})

mousetrap.bind("top-left", components.walker.toggle(), { delay = 300 })

mousetrap.bind("bottom-left", actions.specialworkspace.toggle(), { delay = 300 })

mousetrap.bind("bottom-right", components.walker.toggle({ provider = "windows" }), { delay = 50 })

mousetrap.bind("top-right", function()
	hl.exec_cmd("hyprlock")
end, { delay = 1000 })

mousetrap.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), { flick = 50 })
mousetrap.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), { flick = 50 })

mousetrap.bind("left", actions.window.focus("l"), { flick = 20 })
mousetrap.bind("right", actions.window.focus("r"), { flick = 20 })

addons.mousetrap = mousetrap
