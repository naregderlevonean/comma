local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
    geometry = {
        default = { corner = 16, edge = 4 },
    }
})

mousetrap.bind("top-left", function() hl.exec_cmd("walker") end, { delay = 100 })
mousetrap.bind("bottom-left", function() hl.dispatch(hl.dsp.workspace.toggle_special("")) end, { delay = 100 })
mousetrap.bind("bottom-right", function() hl.exec_cmd("walker --provider windows") end, { delay = 100 })
mousetrap.bind("top-right", function() hl.exec_cmd("hyprlock") end, { delay = 1000 })
mousetrap.bind("top", helpers.workspace.prev(), { delay = 500 })
mousetrap.bind("bottom", helpers.workspace.next(), { delay = 500 })

addons.mousetrap = mousetrap

