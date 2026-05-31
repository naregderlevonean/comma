hl.bind("SUPER + CTRL + ALT + Up",   helpers.workspace.movewindowprev())
hl.bind("SUPER + CTRL + ALT + Down", helpers.workspace.movewindownext())

hl.bind("SUPER + CTRL + ALT + Home", helpers.workspace.movewindowhome())
hl.bind("SUPER + CTRL + ALT + End",  helpers.workspace.movewindowlast())

hl.bind("SUPER + CTRL + ALT + Left",  hl.dsp.window.move({ workspace = "special" }))
hl.bind(
    "SUPER + SHIFT + CTRL + ALT + Right",
    helpers.scoped.workspace(
        hl.dsp.window.move({ workspace = "+0" }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

