local scoped = actions.scoped.workspace

hl.bind("SUPER + CTRL + ALT + 0", scoped(actions.workspace.layout("monocle"), { special = true }))

hl.bind("SUPER + SHIFT + CTRL + ALT + 0", function()
	hl.config({ general = { layout = "monocle" } })
	actions.workspace.blanket("monocle")
end)
