local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
    geometry = {
        default = { corner = 4, edge = 2 },
        ["eDP-1"] = { corner = 60, edge = 10 }
    }
})

mousetrap.bind("top-left", function()
    hl.exec_cmd("walker")
end, { delay = 200 })

mousetrap.bind("bottom-right", function()
    hl.exec_cmd("walker --provider windows")
end, { delay = 200 })

mousetrap.bind("top-right", function()
    hl.exec_cmd("hyprlock")
end, { delay = 1000 })

mousetrap.bind("top", function()
    hl.dispatch(hl.dsp.focus({ workspace = "e-1" }))
end, { flick = 100 })

mousetrap.bind("bottom", function()
    hl.dispatch(hl.dsp.focus({ workspace = "r+1" }))
end, { flick = 100 })

addons.mousetrap = mousetrap

