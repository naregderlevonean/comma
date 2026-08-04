hl.bind("SUPER + CTRL + ALT + 0", function()
	actions.workspace.layout("monocle")
end)

hl.bind("SUPER + SHIFT + CTRL + ALT + 0", function()
	hl.config({ general = { layout = "monocle" } })
	actions.workspace.blanket("monocle")
end)
