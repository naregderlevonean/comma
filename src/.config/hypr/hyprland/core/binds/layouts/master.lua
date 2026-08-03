hl.bind("SUPER CTRL + ALT + 3", function()
	actions.workspace.layout("master")
end)

hl.bind("SUPER + SHIFT CTRL + ALT + 3", function()
	hl.config({ general = { layout = "master" } })
	actions.workspace.blanket("master")
end)
