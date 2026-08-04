hl.bind("SUPER + CTRL + ALT + 1", function()
	actions.workspace.layout("scrolling")
end)

hl.bind("SUPER + SHIFT + CTRL + ALT + 1", function()
	hl.config({ general = { layout = "scrolling" } })
	actions.workspace.blanket("scrolling")
end)

hl.bind("SUPER + + CTRL + C", actions.window.fit())
