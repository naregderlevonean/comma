hl.gesture({ fingers = 3, direction = "down", action = helpers.scoped.workspace(
    hl.dsp.window.close(),
    { exclude = { "special:stylus", "special:radio" } }
)})

