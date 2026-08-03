hl.bind("SUPER CTRL + ALT + 5", function()
	actions.workspace.layout("lua:columns")
end)

hl.bind("SUPER + SHIFT CTRL + ALT + 5", function()
	hl.config({ general = { layout = "lua:columns" } })
	actions.workspace.blanket("lua:columns")
end)
