hl.gesture({
	fingers = 3,
	direction = "up",
	action = actions.scoped.workspace(
		actions.workspace.focus("next"),
		{ exclude = { "special:stylus", "special:radio" } }
	),
})

hl.gesture({
	fingers = 3,
	direction = "down",
	action = actions.scoped.workspace(
		actions.workspace.focus("prev"),
		{ exclude = { "special:stylus", "special:radio" } }
	),
})

hl.gesture({
	fingers = 3,
	direction = "left",
	action = actions.specialworkspace.start(),
})

hl.gesture({
	fingers = 3,
	direction = "right",
	action = actions.specialworkspace.stop(),
})
