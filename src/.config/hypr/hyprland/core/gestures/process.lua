hl.gesture({
    fingers = 3,
    direction = "down",
    action = actions.scoped.workspace(
        hl.dsp.window.close(),
        { exclude = { "special:stylus", "special:radio" } }
    )
})
