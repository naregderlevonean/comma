local scoped = actions.scoped.workspace

hl.bind("SUPER + CTRL + ALT + 4", scoped(actions.workspace.layout("lua:grid"), { special = true }))

hl.bind("SUPER + SHIFT + CTRL + ALT + 4", function()
	hl.config({ general = { layout = "lua:grid" } })
	actions.workspace.blanket("lua:grid")
end)
