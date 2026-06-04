hl.bind("CTRL + ALT + mouse:276", hl.dsp.group.prev())
hl.bind("CTRL + ALT + mouse:275", hl.dsp.group.next())

hl.bind("SUPER + mouse:275", actions.window.focus("prev"))
hl.bind("SUPER + mouse:276", actions.window.focus("next"))

hl.bind("SUPER + CTRL + mouse:275", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + CTRL + mouse:276", hl.dsp.window.swap({ direction = "r" }))

hl.bind("SUPER + SHIFT + mouse:275", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + mouse:276", hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + ALT + mouse:275", actions.scoped.workspace(actions.workspace.focus("prev")))
hl.bind("SUPER + ALT + mouse:276", actions.scoped.workspace(actions.workspace.focus("next")))

hl.bind("SUPER + CTRL + ALT + mouse:275", actions.scoped.workspace(actions.window.move("prev", { follow = true })))
hl.bind("SUPER + CTRL + ALT + mouse:276", actions.scoped.workspace(actions.window.move("next", { follow = true })))

hl.bind("SUPER + SHIFT + CTRL + ALT + mouse:275", actions.scoped.workspace(actions.window.move("prev")))
hl.bind("SUPER + SHIFT + CTRL + ALT + mouse:276", actions.scoped.workspace(actions.window.move("next")))
