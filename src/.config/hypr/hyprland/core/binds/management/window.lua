hl.bind("SUPER + CTRL + Escape", helpers.scoped.workspace(helpers.window.float()))
hl.bind("SUPER + CTRL + Grave", helpers.scoped.workspace(hl.dsp.window.pin()))
hl.bind("SUPER + CTRL + Return", helpers.scoped.workspace(hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })))

