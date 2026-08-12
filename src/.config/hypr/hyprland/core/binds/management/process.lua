local scoped = actions.scoped.workspace

hl.bind("SUPER + Q", scoped(hl.dsp.window.close(), { special = true }))
