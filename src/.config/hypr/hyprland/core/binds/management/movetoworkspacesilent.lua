hl.bind("SUPER + SHIFT + CTRL + ALT + Up", helpers.workspace.movewindowprevsilent())
hl.bind("SUPER + SHIFT + CTRL + ALT + Down", helpers.workspace.movewindownextsilent())

hl.bind("SUPER + SHIFT + CTRL + ALT + Home", helpers.workspace.movewindowhomesilent())
hl.bind("SUPER + SHIFT + CTRL + ALT + End",  helpers.workspace.movewindowlastsilent())

hl.bind("SUPER + SHIFT + CTRL + ALT + Left",  hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(
    "SUPER + SHIFT + CTRL + ALT + Right",
    helpers.scoped.workspace(
        hl.dsp.window.move({ workspace = "+0", follow = false }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

