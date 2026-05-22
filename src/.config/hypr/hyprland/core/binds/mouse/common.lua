hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + CTRL + mouse:272", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind("SUPER + CTRL + mouse:273", helpers.window.float())

hl.bind("SUPER + SHIFT + CTRL + mouse:272", hl.dsp.window.close())

