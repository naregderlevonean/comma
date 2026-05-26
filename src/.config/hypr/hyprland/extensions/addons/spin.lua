local spin = require("hyprland.extensions.addons.spin.init").setup({
    interval = 500,
    devices = {
        monitors = { "eDP-1" },
        touchdevices = { "eDP-1" },
        tablets = { "eDP-1" },
    }
})

spin.bind({ "left-up", "right-up" }, function(orientation, transform)
    hl.dsp.send_shortcut({ mods = "SUPER + SHIFT + ALT", key = "1" })
end)

spin.bind({"normal", "bottom-up"}, function(orientation, transform)
    hl.dsp.send_shortcut({ mods = "SUPER + SHIFT + ALT", key = "2" })
end)

addons.spin = spin

