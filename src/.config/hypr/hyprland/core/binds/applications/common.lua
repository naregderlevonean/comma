local function launch(application)
    return helpers.scoped.workspace(
        hl.dsp.exec_cmd(application),
        { exclude = { "special:stylus", "special:radio" } }
    )
end

hl.bind("SUPER + 1", launch("kitty"))
hl.bind("SUPER + SHIFT + 1", launch("kitty su"))
hl.bind("SUPER + 2", launch("nautilus"))
hl.bind("SUPER + 3", launch("firefox"))
hl.bind("SUPER + SHIFT + 3", launch("firefox --private-window"))
hl.bind("SUPER + 4", launch("obsidian"))
hl.bind("SUPER + 5", launch("firefoxpwa site launch 01KNNNV87QMX0FV61E7GFR86W2"))

