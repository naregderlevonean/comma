local movetoworkspace = actions.window.movetoworkspace
local movetoworkspacedirection = actions.window.movetoworkspacedirection

hl.bind("SUPER + SHIFT + CTRL + ALT + Up", movetoworkspacedirection("prev", { follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + Down", movetoworkspacedirection("next", { follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + Home", movetoworkspacedirection("home", { follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + End", movetoworkspacedirection("last", { follow = false }))

hl.bind("SUPER + SHIFT + CTRL + ALT + Left", movetoworkspace("special:special", { follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + Right", movetoworkspace("+0", { follow = false }))
