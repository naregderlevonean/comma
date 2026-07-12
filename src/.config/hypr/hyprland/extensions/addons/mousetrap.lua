local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = { corner = 8, edge = 2 },
	},
})

mousetrap.bind("top-left", components.walker.toggle())

mousetrap.bind("bottom-left", actions.specialworkspace.toggle())

mousetrap.bind("bottom-right", components.walker.toggle({ provider = "windows" }))

mousetrap.bind("top-right", function()
	hl.exec_cmd("hyprlock")
end, { delay = 1000 })

mousetrap.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")))
mousetrap.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")))

mousetrap.bind("left", actions.window.focus("l"))
mousetrap.bind("right", actions.window.focus("r"))

addons.mousetrap = mousetrap
