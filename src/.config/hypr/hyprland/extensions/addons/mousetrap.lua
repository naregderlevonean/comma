local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
    geometry = {
        default = { corner = 4, edge = 2 },
        ["eDP-1"] = { corner = 60, edge = 10 }
    }
})

mousetrap.bind("top-left", function()
    hl.exec_cmd("walker")
end, { flick = 100 })

mousetrap.bind("bottom-right", function()
    hl.exec_cmd("walker --provider windows")
end, { flick = 100 })

mousetrap.bind("top-right", function()
    hl.exec_cmd("hyprlock")
end, { delay = 1000 })

mousetrap.bind("top", helpers.workspace.prev(), { flick = 100 })
mousetrap.bind("bottom", helpers.workspace.next(), { flick = 100 })

addons.mousetrap = mousetrap
