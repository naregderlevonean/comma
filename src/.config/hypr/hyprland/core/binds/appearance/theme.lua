hl.bind("SUPER + SHIFT + ALT + F", function() themes.focus.init() end)
hl.bind("SUPER + SHIFT + ALT + S", function() themes.supernova.init() end)
hl.bind("SUPER + SHIFT + ALT + T", function() themes.tape.init() end)
hl.bind("SUPER + SHIFT + ALT + Z", function() themes.zero.init() end)

hl.bind("SUPER + SHIFT + ALT + Escape", function()
    components.waybar.start()()
    hl.exec_cmd("hyprctl reload")
end)

