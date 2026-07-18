local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = { corner = 2, edge = 2 },
	},
})

mousetrap.bind("top-left", components.walker.toggle(), { delay = 300 })
mousetrap.bind("bottom-right", components.walker.toggle({ provider = "windows" }), { delay = 300 })

mousetrap.bind("bottom-left", actions.specialworkspace.toggle(), { delay = 300 })

mousetrap.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), { delay = 200 })
mousetrap.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), { delay = 200 })

mousetrap.bind("left", actions.window.focus("l"), { delay = 200 })
mousetrap.bind("right", actions.window.focus("r"), { delay = 200 })

addons.mousetrap = mousetrap
