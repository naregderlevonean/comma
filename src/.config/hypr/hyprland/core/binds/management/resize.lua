hl.bind("SUPER + CTRL + R", hl.dsp.submap("resize"))

hl.define_submap("resize", function()
    local function step(x, y)
        return hl.dsp.window.resize({ x = x, y = y, relative = true })
    end

    hl.bind("Down", step(0, 1), { repeating = true })
    hl.bind("Left", step(-1, 0), { repeating = true })
    hl.bind("Right", step(1, 0), { repeating = true })
    hl.bind("Up", step(0, -1), { repeating = true })

    hl.bind("SHIFT + Down", step(0, 10), { repeating = true })
    hl.bind("SHIFT + Left", step(-10, 0), { repeating = true })
    hl.bind("SHIFT + Right", step(10, 0), { repeating = true })
    hl.bind("SHIFT + Up", step(0, -10), { repeating = true })

    hl.bind("Escape", hl.dsp.submap("reset"))
    hl.bind("Return", hl.dsp.submap("reset"))
end)

