hl.bind(
    "SUPER + Q",
    actions.scoped.workspace(
        hl.dsp.window.close(),
        { exclude = { "special:stylus", "special:radio" } }
    )
)

