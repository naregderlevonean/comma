hl.bind("SUPER + ALT + 4", function()
    actions.workspace.layout("lua:grid")
end)

hl.bind("SUPER + SHIFT + ALT + 4", function()
    hl.config({ general = { layout = "lua:grid" } })
    actions.workspace.blanket("lua:grid")
end)
