hl.bind(
    "SUPER + SHIFT + CTRL + ALT + Up",
    actions.scoped.workspace(
        actions.window.move("prev"),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + SHIFT + CTRL + ALT + Down",
    actions.scoped.workspace(
        actions.window.move("next"),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + SHIFT + CTRL + ALT + Home",
    actions.scoped.workspace(
        actions.window.move("home"),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + SHIFT + CTRL + ALT + End",
    actions.scoped.workspace(
        actions.window.move("last"),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + SHIFT + CTRL + ALT + Left",
    actions.scoped.workspace(
        hl.dsp.window.move({ workspace = "special", follow = false }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + SHIFT + CTRL + ALT + Right",
    actions.scoped.workspace(
        hl.dsp.window.move({ workspace = "+0", follow = false }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)
