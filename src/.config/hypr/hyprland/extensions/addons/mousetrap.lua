local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = {
			corner = 4,
			edge = 4,
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

mousetrap.bind("right", actions.scoped.workspace(actions.workspace.focus("next")), {
	direction = "up",
	distance = 500,
	loop = true,
})

mousetrap.bind("right", actions.scoped.workspace(actions.workspace.focus("prev")), {
	direction = "down",
	distance = 500,
	loop = true,
})

mousetrap.bind("right", function()
	hl.bind("mouse_up", actions.scoped.workspace(actions.workspace.focus("prev")))
	hl.bind("mouse_down", actions.scoped.workspace(actions.workspace.focus("next")))
end, {
	delay = 500,
})

mousetrap.bind("right", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

mousetrap.bind("bottom-left", actions.specialworkspace.toggle(), {
	delay = 500,
})

-- Layout

mousetrap.bind("left", actions.window.fit(), {
	flick = 100,
})

-- Window

mousetrap.bind("bottom", actions.window.focus("r"), {
	direction = "left",
	distance = 500,
	loop = true,
})

mousetrap.bind("bottom", actions.window.focus("l"), {
	direction = "right",
	distance = 500,
	loop = true,
})

mousetrap.bind("bottom", function()
	hl.bind("mouse_up", actions.window.focus("l"))
	hl.bind("mouse_down", actions.window.focus("r"))
end, {
	delay = 500,
})

mousetrap.bind("bottom", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

-- Overview

mousetrap.bind("top-left", function()
	if hl.get_current_submap() == "hyprexpo" then
		hl.dispatch(plugins.hyprexpo.stop())
	else
		hl.dispatch(plugins.hyprexpo.start())
	end
end, {
	delay = 200,
})

return mousetrap
