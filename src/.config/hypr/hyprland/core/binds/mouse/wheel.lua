hl.bind("CTRL + ALT + mouse_up", hl.dsp.group.prev())
hl.bind("CTRL + ALT + mouse_down", hl.dsp.group.next())

hl.bind("SUPER + mouse_down", actions.window.focus("prev"))
hl.bind("SUPER + mouse_up", actions.window.focus("next"))

hl.bind("SUPER + CTRL + mouse_down",   hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + CTRL + mouse_up", hl.dsp.window.swap({ direction = "r" }))

hl.bind("SUPER + SHIFT + mouse_down",   hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + ALT + mouse_down", actions.scoped.workspace(actions.workspace.focus("prev")))
hl.bind("SUPER + ALT + mouse_up", actions.scoped.workspace(actions.workspace.focus("next")))

hl.bind("SUPER + CTRL + ALT + mouse_down", actions.scoped.workspace(actions.window.move("prev", { follow = true })))
hl.bind("SUPER + CTRL + ALT + mouse_up", actions.scoped.workspace(actions.window.move("next", { follow = true })))

hl.bind("SUPER + SHIFT + CTRL + ALT + mouse_down", actions.scoped.workspace(actions.window.move("prev")))
hl.bind("SUPER + SHIFT + CTRL + ALT + mouse_up", actions.scoped.workspace(actions.window.move("next")))
