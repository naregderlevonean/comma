hl.bind(
    "SUPER + ALT + Escape",
    actions.specialworkspace.toggle("", {
        start = function() components.waybar.hide()() end,
        stop  = function() components.waybar.show()() end
    })
)

hl.bind(
    "SUPER + ALT + Grave",
    actions.specialworkspace.toggle("radio", {
        start = function() components.waybar.hide()() end,
        stop  = function() components.waybar.show()() end
    })
)

hl.bind(
    "SUPER + ALT + Tab",
    actions.specialworkspace.toggle("stylus", {
        start = function() components.waybar.hide()() end,
        stop  = function() components.waybar.show()() end
    })
)
