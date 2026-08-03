hl.bind("SUPER CTRL + ALT + 4", function()
	actions.workspace.layout("lua:grid")
end)

hl.bind("SUPER + SHIFT CTRL + ALT + 4", function()
	hl.config({ general = { layout = "lua:grid" } })
	actions.workspace.blanket("lua:grid")
end)
