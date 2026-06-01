local function scrolling(width)
    if hl.get_config("general.layout") == "scrolling" then
        system.scheduler.config({ general = { layout = "monocle" } })
        system.scheduler.config({
            general = { layout = "scrolling" },
            scrolling = { column_width = width }
        })
    end
end

hl.bind("SUPER + SHIFT + ALT + 0", function()
    hl.config({ general = { layout = "monocle" } })
end)

hl.bind("SUPER + SHIFT + ALT + 1", function()
    scrolling(1.000000)
end)

hl.bind("SUPER + SHIFT + ALT + 2", function()
    scrolling(0.500000)
end)

hl.bind("SUPER + SHIFT + ALT + 3", function()
    scrolling(0.333333)
end)

hl.bind("SUPER + SHIFT + ALT + 4", function()
    hl.config({ general = { layout = "dwindle" } })
end)

hl.bind("SUPER + SHIFT + ALT + 5", function()
    hl.config({ general = { layout = "master" } })
end)

