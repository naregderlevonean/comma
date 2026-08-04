hl.bind("SUPER + CTRL + ALT + 2", function()
	actions.workspace.layout("dwindle")
end)

hl.bind("SUPER + SHIFT + CTRL + ALT + 2", function()
	hl.config({ general = { layout = "dwindle" } })
	actions.workspace.blanket("dwindle")
end)
