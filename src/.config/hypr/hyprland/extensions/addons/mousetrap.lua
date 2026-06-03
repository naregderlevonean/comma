local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
    geometry = {
        default = { corner = 16, edge = 4 },
    }
})

mousetrap.bind("top-left", components.walker.toggle(), { delay = 300 })

mousetrap.bind("bottom-left", actions.specialworkspace.toggle(), { delay = 300 })

mousetrap.bind("bottom-right", components.walker.toggle({ provider = "windows" }), { delay = 100 })

mousetrap.bind("top-right", function() hl.dsp.exec_cmd("hyprlock") end, { delay = 1000 })

mousetrap.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), { flick = 150 })
mousetrap.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), { flick = 150 })

addons.mousetrap = mousetrap
