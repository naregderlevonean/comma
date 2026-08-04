hl.bind(
	"SUPER + Tab",
	actions.scoped.workspace(hl.dsp.focus({ monitor = "+1" })({ exclude = { "special:stylus", "special:radio" } }))
)
hl.bind(
	"SUPER + SHIFT + Tab",
	actions.scoped.workspace(hl.dsp.focus({ monitor = "-1" })({ exclude = { "special:stylus", "special:radio" } }))
)

hl.bind(
	"SUPER + CTRL + Tab",
	actions.scoped.workspace(
		hl.dsp.window.move({ monitor = "+1" })({ exclude = { "special:stylus", "special:radio" } })
	)
)
hl.bind(
	"SUPER + SHIFT + CTRL + Tab",
	actions.scoped.workspace(
		hl.dsp.window.move({ monitor = "-1" })({ exclude = { "special:stylus", "special:radio" } })
	)
)
