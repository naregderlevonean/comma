hl.bind("CTRL + ALT + mouse_down", hl.dsp.group.prev())
hl.bind("CTRL + ALT + mouse_up",   hl.dsp.group.next())

hl.bind("SUPER + mouse_down", helpers.window.prev())
hl.bind("SUPER + mouse_up", helpers.window.next())

hl.bind("SUPER + ALT + mouse_down", helpers.workspace.prev())
hl.bind("SUPER + ALT + mouse_up", helpers.workspace.next())

hl.bind("SUPER + CTRL + mouse_down", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + CTRL + mouse_up",   hl.dsp.window.swap({ direction = "r" }))

hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + mouse_up",   hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + CTRL + ALT + mouse_down", helpers.workspace.movewindowprev())
hl.bind("SUPER + CTRL + ALT + mouse_up", helpers.workspace.movewindownext())

hl.bind("SUPER + SHIFT + CTRL + ALT + mouse_down", helpers.workspace.movewindowprevsilent())
hl.bind("SUPER + SHIFT + CTRL + ALT + mouse_up", helpers.workspace.movewindownextsilent())
