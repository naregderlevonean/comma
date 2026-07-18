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

hl.bind("SUPER + CTRL + C", function()
	local state = tonumber(hl.get_config("scrolling:focus_fit_method"))
	local next_state = (state == 1) and 0 or 1

	hl.config({
		scrolling = {
			focus_fit_method = next_state,
		},
	})
end)
