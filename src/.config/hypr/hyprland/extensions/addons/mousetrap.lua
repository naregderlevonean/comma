local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
    geometry = {
        default = { corner = 16, edge = 4 },
    }
})

mousetrap.bind("top-left", components.walker.toggle(), { delay = 100 })
mousetrap.bind("bottom-left", helpers.specialworkspace.toggle(""), { delay = 100 })
mousetrap.bind("bottom-right", components.walker.toggle({ provider = "windows" }), { delay = 100 })
mousetrap.bind("top-right", function() hl.dsp.exec_cmd("hyprlock") end, { delay = 1000 })
mousetrap.bind("top", helpers.scoped.workspace(helpers.workspace.prev()), { flick = 100 })
mousetrap.bind("bottom", helpers.scoped.workspace(helpers.workspace.next()), { flick = 100 })

addons.mousetrap = mousetrap

