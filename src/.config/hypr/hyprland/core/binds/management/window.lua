hl.bind("SUPER + CTRL + Escape", actions.scoped.workspace(actions.window.float()))

hl.bind("SUPER + CTRL + Grave", actions.scoped.workspace(hl.dsp.window.pin()))

hl.bind(
	"SUPER + CTRL + Return",
	actions.scoped.workspace(hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
)

hl.bind(
	"SUPER + CTRL + Space",
	actions.scoped.workspace(hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
)

hl.bind("SUPER + CTRL + Tab", hl.dsp.layout("colresize +conf"))
