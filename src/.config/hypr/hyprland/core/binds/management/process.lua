hl.bind(
    "SUPER + Q",
    helpers.scoped.workspace(
        hl.dsp.window.close(),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

