hl.bind("SUPER + ALT + 1", function()
	actions.workspace.layout("scrolling")
end)

hl.bind("SUPER + SHIFT + ALT + 1", function()
	hl.config({ general = { layout = "scrolling" } })
	actions.workspace.blanket("scrolling")
end)

hl.bind("SUPER + CTRL + 1", hl.dsp.layout("colresize 0.9"))
hl.bind("SUPER + CTRL + 2", hl.dsp.layout("colresize 0.5"))
hl.bind("SUPER + CTRL + 3", hl.dsp.layout("colresize 0.333333"))

hl.bind("SUPER + SHIFT + CTRL + 1", hl.dsp.layout("colresize all 0.9"))
hl.bind("SUPER + SHIFT + CTRL + 2", hl.dsp.layout("colresize all 0.5"))
hl.bind("SUPER + SHIFT + CTRL + 3", hl.dsp.layout("colresize all 0.333333"))

hl.bind("SUPER + CTRL + C", actions.window.fit())
