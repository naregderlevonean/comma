local function scrolling(width)
	system.scheduler.config({ general = { layout = "monocle" } })
	system.scheduler.config({
		general = { layout = "scrolling" },
		scrolling = { column_width = width },
	})
end

hl.bind("SUPER + ALT + 0", function()
	hl.config({ general = { layout = "monocle" } })
end)

hl.bind("SUPER + ALT + 1", function()
	scrolling(1.000000)
end)

hl.bind("SUPER + ALT + 2", function()
	scrolling(0.500000)
end)

hl.bind("SUPER + ALT + 3", function()
	scrolling(0.333333)
end)

hl.bind("SUPER + ALT + 4", function()
	hl.config({ general = { layout = "dwindle" } })
end)

hl.bind("SUPER + ALT + 5", function()
	hl.config({ general = { layout = "master" } })
end)

hl.bind("SUPER + ALT + 6", function()
	hl.config({ general = { layout = "lua:grid" } })
end)

hl.bind("SUPER + ALT + 7", function()
	hl.config({ general = { layout = "lua:columns" } })
end)

hl.bind("SUPER + SHIFT + ALT + 0", function()
	actions.scoped.workspace(actions.workspace.layout("monocle"))
end)

hl.bind("SUPER + SHIFT + ALT + 1", function()
	system.scheduler.dispatch(actions.scoped.workspace(actions.workspace.layout("monocle")))
	system.scheduler.dispatch(system.scheduler.config({ scrolling = { column_width = 1.000000 } }))
	actions.scoped.workspace(actions.workspace.layout("scrolling"))
end)

hl.bind("SUPER + SHIFT + ALT + 2", function()
	system.scheduler.dispatch(actions.scoped.workspace(actions.workspace.layout("monocle")))
	system.scheduler.dispatch(system.scheduler.config({ scrolling = { column_width = 0.500000 } }))
	actions.scoped.workspace(actions.workspace.layout("scrolling"))
end)

hl.bind("SUPER + SHIFT + ALT + 3", function()
	system.scheduler.dispatch(actions.scoped.workspace(actions.workspace.layout("monocle")))
	system.scheduler.dispatch(system.scheduler.config({ scrolling = { column_width = 0.333333 } }))
	actions.scoped.workspace(actions.workspace.layout("scrolling"))
end)

hl.bind("SUPER + SHIFT + ALT + 4", function()
	actions.scoped.workspace(actions.workspace.layout("dwindle"))
end)

hl.bind("SUPER + SHIFT + ALT + 5", function()
	actions.scoped.workspace(actions.workspace.layout("master"))
end)

hl.bind("SUPER + SHIFT + ALT + 6", function()
	actions.scoped.workspace(actions.workspace.layout("lua:grid"))
end)

hl.bind("SUPER + SHIFT + ALT + 7", function()
	actions.scoped.workspace(actions.workspace.layout("lua:columns"))
end)
