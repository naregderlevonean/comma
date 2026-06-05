hl.bind("SUPER + ALT + 2", function()
    actions.workspace.layout("dwindle")
end)

hl.bind("SUPER + SHIFT + ALT + 2", function()
    hl.config({ general = { layout = "dwindle" } })
    actions.workspace.blanket("dwindle")
end)
