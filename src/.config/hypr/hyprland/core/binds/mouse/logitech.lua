local focus = actions.window.focus
local swap = actions.window.swap
local movetoworkspacedirection = actions.window.movetoworkspacedirection
local scoped = actions.scoped.workspace

hl.bind("CTRL + ALT + mouse:276", hl.dsp.group.prev())
hl.bind("CTRL + ALT + mouse:275", hl.dsp.group.next())

hl.bind("SUPER + mouse:275", focus("l"))
hl.bind("SUPER + mouse:276", focus("r"))

hl.bind("SUPER + CTRL + mouse:275", swap("l"))
hl.bind("SUPER + CTRL + mouse:276", swap("r"))

hl.bind("SUPER + SHIFT + mouse:275", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + mouse:276", hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + ALT + mouse:275", scoped(actions.workspace.focus("prev")))
hl.bind("SUPER + ALT + mouse:276", scoped(actions.workspace.focus("next")))

hl.bind("SUPER + CTRL + ALT + mouse:275", movetoworkspacedirection("prev"))
hl.bind("SUPER + CTRL + ALT + mouse:276", movetoworkspacedirection("next"))

hl.bind("SUPER + SHIFT + CTRL + ALT + mouse:275", movetoworkspacedirection("prev", { follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + mouse:276", movetoworkspacedirection("next", { follow = false }))
