local scoped = actions.scoped.workspace

hl.bind("SUPER + CTRL + ALT + 1", scoped(actions.workspace.layout("scrolling")))

hl.bind("SUPER + SHIFT + CTRL + ALT + 1", function()
	hl.config({ general = { layout = "scrolling" } })
	actions.workspace.blanket("scrolling")
end)

hl.bind("SUPER + + CTRL + C", actions.window.fit())
