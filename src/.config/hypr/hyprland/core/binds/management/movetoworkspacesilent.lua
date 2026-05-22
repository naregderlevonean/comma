hl.bind("SUPER + SHIFT + CTRL + ALT + Up",  hl.dsp.window.move({ workspace = "e-1", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + Down",hl.dsp.window.move({ workspace = "r+1", follow = false }))

hl.bind("SUPER + SHIFT + CTRL + ALT + Home",  hl.dsp.window.move({ workspace = "e~0", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + End",hl.dsp.window.move({ workspace = "empty", follow = false }))

hl.bind("SUPER + SHIFT + CTRL + ALT + Left",  hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + Right", hl.dsp.window.move({ workspace = "+0", follow = false }))

hl.bind("SUPER + SHIFT + CTRL + ALT + Grave", hl.dsp.window.move({ workspace = "special:radio", follow = false }))
hl.bind("SUPER + SHIFT + CTRL + ALT + Tab",   hl.dsp.window.move({ workspace = "special:stylus", follow = false }))

