hl.bind(
    "SUPER + CTRL + ALT + Up",
    actions.scoped.workspace(
        actions.window.move("prev", { follow = true }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + CTRL + ALT + Down",
    actions.scoped.workspace(
        actions.window.move("next", { follow = true }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + CTRL + ALT + Home",
    actions.scoped.workspace(
        actions.window.move("home", { follow = true }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + CTRL + ALT + End",
    actions.scoped.workspace(
        actions.window.move("last", { follow = true }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + CTRL + ALT + Left",
    actions.scoped.workspace(
        actions.window.stash({
            workspace = "special",
            callback = function() components.waybar.hide()() end
        }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

hl.bind(
    "SUPER + CTRL + ALT + Right",
    actions.scoped.workspace(
        actions.window.stash({
            workspace = "+0",
            callback = function() components.waybar.show()() end
        }),
        { exclude = { "special:stylus", "special:radio" } }
    )
)
