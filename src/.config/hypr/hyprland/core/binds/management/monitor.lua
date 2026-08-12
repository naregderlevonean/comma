local scoped = actions.scoped.workspace

hl.bind("SUPER + Tab", scoped(hl.dsp.focus({ monitor = "+1" }), { special = true }))
hl.bind("SUPER + CTRL + Tab", scoped(hl.dsp.window.move({ monitor = "+1" }), { special = true }))

hl.bind("SUPER + SHIFT + Tab", scoped(hl.dsp.focus({ monitor = "-1" }), { special = true }))
hl.bind("SUPER + SHIFT + CTRL + Tab", scoped(hl.dsp.window.move({ monitor = "-1" }), { special = true }))
