local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = { corner = 8, edge = 2 },
	},
})

mousetrap.bind("top-left", components.walker.toggle())
mousetrap.bind("bottom-right", components.walker.toggle({ provider = "windows" }))

mousetrap.bind("bottom-left", actions.specialworkspace.toggle())

mousetrap.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), { delay = 100 })
mousetrap.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), { delay = 100 })

mousetrap.bind("left", actions.window.focus("l"), { delay = 100 })
mousetrap.bind("right", actions.window.focus("r"), { delay = 100 })

addons.mousetrap = mousetrap
