hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + CTRL + mouse:272", actions.window.float())
hl.bind("SUPER + CTRL + mouse:273", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind("SUPER + CTRL + mouse:274", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

hl.bind("SUPER + SHIFT + CTRL + mouse:272", hl.dsp.window.close())
