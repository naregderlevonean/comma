local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
    geometry = {
        default = { corner = 4, edge = 2 },
        ["eDP-1"] = { corner = 60, edge = 10 }
    }
})

hl.bind("ALT_L", mousetrap.modifiers({ alt = true }))

hl.bind("ALT + ALT_L", mousetrap.modifiers({ alt = false }), { release = true })

mousetrap.bind("top", function()
    hl.exec_cmd("notify-send 'Секретное меню!'")
end, { modifiers = { alt = true } })addons.mousetrap = mousetrap

