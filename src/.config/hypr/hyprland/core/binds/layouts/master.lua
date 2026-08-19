local scoped = actions.scoped.workspace

hl.bind("SUPER + CTRL + ALT + 3", scoped(actions.workspace.layout("master"), { special = true }))

hl.bind("SUPER + SHIFT + CTRL + ALT + 3", function()
	hl.config({ general = { layout = "master" } })
	actions.workspace.blanket("master")
end)
