local scoped = actions.scoped.workspace

local function launch(application)
	return scoped(hl.dsp.exec_cmd(application), { special = true })
end

hl.bind("SUPER + F4", launch("waypaper"))
hl.bind("SUPER + F5", launch("gnome-calculator"))
hl.bind("SUPER + F6", launch("dialect"))
hl.bind("SUPER + F7", launch("gnome-characters"))
hl.bind("SUPER + F8", launch("gradia --screenshot"))
hl.bind("SUPER + F9", launch("eyedropper"))

hl.bind("SUPER + SHIFT + F8", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
