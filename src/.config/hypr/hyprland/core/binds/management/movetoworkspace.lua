hl.bind("SUPER + CTRL + ALT + Up",   helpers.workspace.movewindowprev())
hl.bind("SUPER + CTRL + ALT + Down", helpers.workspace.movewindownext())

hl.bind("SUPER + CTRL + ALT + Home", helpers.workspace.movewindowhome())
hl.bind("SUPER + CTRL + ALT + End",  helpers.workspace.movewindowlast())

hl.bind("SUPER + CTRL + ALT + Left",  hl.dsp.window.move({ workspace = "special" }))
hl.bind("SUPER + CTRL + ALT + Right", hl.dsp.window.move({ workspace = "+0" }))

hl.bind("SUPER + CTRL + ALT + Grave", hl.dsp.window.move({ workspace = "special:radio" }))
hl.bind("SUPER + CTRL + ALT + Tab",   hl.dsp.window.move({ workspace = "special:stylus" }))

