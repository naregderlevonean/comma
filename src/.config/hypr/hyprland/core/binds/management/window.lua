local scoped = actions.scoped.workspace

hl.bind("SUPER + CTRL + Escape", scoped(actions.window.float()))
hl.bind("SUPER + CTRL + Grave", scoped(hl.dsp.window.pin()))

hl.bind("SUPER + CTRL + Return", scoped(hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })))
hl.bind("SUPER + CTRL + Space", scoped(hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })))

hl.bind("SUPER + CTRL + Equal", hl.dsp.layout("colresize +conf"))
hl.bind("SUPER + CTRL + Minus", hl.dsp.layout("colresize -conf"))
