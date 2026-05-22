local spin = require("hyprland.extensions.addons.spin.init").setup({
    interval = 500,
    devices = {
        monitors = { "eDP-1" },
        touchdevices = { "eDP-1" },
        tablets = { "eDP-1" },
    }
})

spin.bind({ "left-up", "right-up" }, function(orientation, transform)
    helpers.scheduler.config({ general = { layout = "monocle" } })
    helpers.scheduler.config({
        general = { layout = "scrolling" },
        scrolling = { column_width = 1.000000 }
    })
end)

spin.bind("normal", function(orientation, transform)
    helpers.scheduler.config({ general = { layout = "monocle" } })
    helpers.scheduler.config({
        general = { layout = "scrolling" },
        scrolling = { column_width = 0.500000 }
    })
end)

spin.bind("bottom-up", function(orientation, transform)
    helpers.scheduler.config({ general = { layout = "monocle" } })
    helpers.scheduler.config({
        general = { layout = "scrolling" },
        scrolling = { column_width = 0.500000 }
    })
end)

addons.spin = spin

