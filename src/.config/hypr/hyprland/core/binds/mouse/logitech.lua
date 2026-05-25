hl.bind("CTRL + ALT + mouse:275", hl.dsp.group.prev())
hl.bind("CTRL + ALT + mouse:276", hl.dsp.group.next())

hl.bind("SUPER + mouse:275", helpers.window.prev())
hl.bind("SUPER + mouse:276", helpers.window.next())

hl.bind("SUPER + ALT + mouse:275", helpers.workspace.prev())
hl.bind("SUPER + ALT + mouse:276", helpers.workspace.next())

hl.bind("SUPER + CTRL + mouse:275", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + CTRL + mouse:276", hl.dsp.window.swap({ direction = "r" }))

hl.bind("SUPER + SHIFT + mouse:275", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + SHIFT + mouse:276", hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + CTRL + ALT + mouse:275", helpers.workspace.movewindownextsilent())
hl.bind("SUPER + CTRL + ALT + mouse:276", helpers.workspace.movewindownextsilent())

hl.bind("SUPER + SHIFT + CTRL + ALT + mouse:275", helpers.workspace.movewindowprevsilent())
hl.bind("SUPER + SHIFT + CTRL + ALT + mouse:276", helpers.workspace.movewindownextsilent())

