local focus = actions.window.focus
local swap = actions.window.swap
local movetoworkspacedirection = actions.window.movetoworkspacedirection
local scoped = actions.scoped.workspace

hl.bind("CTRL + ALT + mouse_down", hl.dsp.group.prev())
hl.bind("CTRL + ALT + mouse_up", hl.dsp.group.next())

hl.bind("SUPER + mouse_up", focus("l"))
hl.bind("SUPER + mouse_down", focus("r"))

hl.bind("SUPER + CTRL + mouse_up", swap("l"))
hl.bind("SUPER + CTRL + mouse_down", swap("r"))

hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + ALT + mouse_up", scoped(actions.workspace.focus("prev")))
hl.bind("SUPER + ALT + mouse_down", scoped(actions.workspace.focus("next")))

hl.bind("SUPER + CTRL + ALT + mouse_up", movetoworkspacedirection("prev"))
hl.bind("SUPER + CTRL + ALT + mouse_down", movetoworkspacedirection("next"))

hl.bind("SUPER + SHIFT + CTRL + ALT + mouse_up", movetoworkspacedirection("prev", { follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + mouse_down", movetoworkspacedirection("next", { follow = false }))
