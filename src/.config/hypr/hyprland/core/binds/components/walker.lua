hl.bind(
	"XF86Search",
	actions.scoped.workspace(components.walker.toggle(), { exclude = { "special:stylus", "special:radio" } })
)

hl.bind(
	"SUPER_L",
	system.press.double(
		actions.scoped.workspace(components.walker.toggle(), { exclude = { "special:stylus", "special:radio" } })
	)
)

hl.bind(
	"SUPER + Space",
	actions.scoped.workspace(
		components.walker.toggle({ provider = "windows" }),
		{ exclude = { "special:stylus", "special:radio" } }
	)
)

hl.bind(
	"SUPER + Grave",
	actions.scoped.workspace(
		components.walker.toggle({ provider = "clipboard" }),
		{ exclude = { "special:stylus", "special:radio" } }
	)
)
