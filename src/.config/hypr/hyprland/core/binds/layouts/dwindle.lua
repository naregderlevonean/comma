local scoped = actions.scoped.workspace

hl.bind("SUPER + CTRL + ALT + 2", scoped(actions.workspace.layout("dwindle"), { special = true }))

hl.bind("SUPER + SHIFT + CTRL + ALT + 2", function()
	hl.config({ general = { layout = "dwindle" } })
	actions.workspace.blanket("dwindle")
end)
