hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer --decrease 1"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer --toggle-mute"), { locked = true })
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("pamixer --increase 1 --set-limit 100"),
	{ locked = true, repeating = true }
)

hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer --decrease 5"), { locked = true, repeating = true })
hl.bind(
	"ALT + XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("pamixer --increase 5 --set-limit 100"),
	{ locked = true, repeating = true }
)

hl.bind("SHIFT + XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer --set-volume 0"))
hl.bind("SHIFT + XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer --set-volume 100"))
