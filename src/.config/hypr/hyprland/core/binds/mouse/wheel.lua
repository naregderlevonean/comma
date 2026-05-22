hl.bind("CTRL + ALT + mouse_down", hl.dsp.group.prev())
hl.bind("CTRL + ALT + mouse_up",   hl.dsp.group.next())

hl.bind("SUPER + mouse_down", helpers.window.navigate("prev"))
hl.bind("SUPER + mouse_up", helpers.window.navigate("next"))

hl.bind("SUPER + ALT + mouse_down", hl.dsp.focus({ workspace = "e-1" }))
hl.bind("SUPER + ALT + mouse_up", hl.dsp.focus({ workspace = "r+1" }))

hl.bind("SUPER + CTRL + mouse_down", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + CTRL + mouse_up",   hl.dsp.window.swap({ direction = "r" }))

hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + mouse_up",   hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + CTRL + ALT + mouse_down", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + ALT + mouse_up", hl.dsp.window.move({ workspace = "r+1" }))

hl.bind("SUPER + SHIFT + CTRL + ALT + mouse_down", hl.dsp.window.move({ workspace = "e-1", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + mouse_up", hl.dsp.window.move({ workspace = "r+1", follow = false }))

