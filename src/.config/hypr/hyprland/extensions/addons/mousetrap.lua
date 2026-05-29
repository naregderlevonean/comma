local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
    geometry = {
        default = { corner = 16, edge = 4 },
    }
})

mousetrap.bind("top-left", function() hl.exec_cmd("walker") end, { flick = 50 })
mousetrap.bind("bottom-left", function() hl.dispatch(hl.dsp.workspace.toggle_special("")) end, { flick = 50 })
mousetrap.bind("bottom-right", function() hl.exec_cmd("walker --provider windows") end, { flick = 100 })
mousetrap.bind("top-right", function() hl.exec_cmd("hyprlock") end, { delay = 1000 })
mousetrap.bind("top", helpers.workspace.prev(), { flick = 150 })
mousetrap.bind("bottom", helpers.workspace.next(), { flick = 150 })

addons.mousetrap = mousetrap
