local scoped = actions.scoped.workspace

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })

hl.bind("SUPER + CTRL + mouse:272", scoped(hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" })))
hl.bind("SUPER + CTRL + mouse:273", scoped(actions.window.float()))
