local movetoworkspace = actions.window.movetoworkspace
local movetoworkspacedirection = actions.window.movetoworkspacedirection

hl.bind("SUPER + CTRL + ALT + Up", movetoworkspacedirection("prev"))
hl.bind("SUPER + CTRL + ALT + Down", movetoworkspacedirection("next"))

hl.bind("SUPER + CTRL + ALT + Home", movetoworkspacedirection("home"))
hl.bind("SUPER + CTRL + ALT + End", movetoworkspacedirection("last"))

hl.bind("SUPER + CTRL + ALT + Left", movetoworkspace("special:special"))
hl.bind("SUPER + CTRL + ALT + Right", movetoworkspace("+0"))
