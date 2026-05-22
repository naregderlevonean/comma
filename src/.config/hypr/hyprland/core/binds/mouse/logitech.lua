hl.bind("CTRL + ALT + mouse:275", hl.dsp.group.prev())
hl.bind("CTRL + ALT + mouse:276", hl.dsp.group.next())

hl.bind("SUPER + mouse:275", helpers.window.navigate("prev"))
hl.bind("SUPER + mouse:276", helpers.window.navigate("next"))

hl.bind("SUPER + ALT + mouse:275", hl.dsp.focus({ workspace = "r+1" }))
hl.bind("SUPER + ALT + mouse:276", hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER + CTRL + mouse:275", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + CTRL + mouse:276", hl.dsp.window.swap({ direction = "r" }))

hl.bind("SUPER + SHIFT + mouse:275", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + mouse:276", hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + CTRL + ALT + mouse:275", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind("SUPER + CTRL + ALT + mouse:276", hl.dsp.window.move({ workspace = "r+1" }))

hl.bind("SUPER + SHIFT + CTRL + ALT + mouse:275", hl.dsp.window.move({ workspace = "e-1", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + mouse:276", hl.dsp.window.move({ workspace = "r+1", follow = false }))

