local scoped = actions.scoped.workspace

hl.bind("SUPER + CTRL + ALT + 5", scoped(actions.workspace.layout("lua:columns")))

hl.bind("SUPER + SHIFT + CTRL + ALT + 5", function()
	hl.config({ general = { layout = "lua:columns" } })
	actions.workspace.blanket("lua:columns")
end)
