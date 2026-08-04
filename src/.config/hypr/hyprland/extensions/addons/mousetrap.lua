local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = {
			corner = 2,
			edge = 2,
		},
	},
})

-- Process

mousetrap.bind("top", function()
	local window = hl.get_active_window()

	if window and window.floating then
		hl.dispatch(actions.scoped.workspace(hl.dsp.window.close(), {
			exclude = {
				"special:stylus",
				"special:radio",
			},
		}))
	end
end, {
	delay = 1000,
})

-- Workspace

mousetrap.bind("right", function()
	hl.bind("mouse_up", actions.scoped.workspace(actions.workspace.focus("prev")))
	hl.bind("mouse_down", actions.scoped.workspace(actions.workspace.focus("next")))
end)

mousetrap.bind("right", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

-- Window

mousetrap.bind("left", actions.window.fit(), {
	flick = 50,
})

mousetrap.bind("bottom", function()
	hl.bind("mouse_up", actions.window.focus("l"))
	hl.bind("mouse_down", actions.window.focus("r"))
end, {
	delay = 200,
})

mousetrap.bind("bottom", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

mousetrap.bind("top-right", function()
	if hl.get_current_submap() == "hyprexpo" then
		hl.dispatch(plugins.hyprexpo.stop())
	else
		hl.dispatch(plugins.hyprexpo.start())
	end
end)

return mousetrap
