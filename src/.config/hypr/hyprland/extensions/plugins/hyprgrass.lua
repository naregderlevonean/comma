hl.config({
	plugin = {
		hyprgrass = {
			sensitivity = 1.0,
			long_press_delay = 1000,
			resize_on_border_long_press = true,
			edge_margin = 8,
		},
	},
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "edge", origin = "u", direction = "d" },
	action = function()
		components.osk.stop()()
		components.waybar.show()()
	end,
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "edge", origin = "d", direction = "u" },
	action = function()
		components.osk.start()()
		components.waybar.hide()()
	end,
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 2, direction = "left" },
	action = hl.dsp.window.swap({ direction = "l" }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 2, direction = "right" },
	action = hl.dsp.window.swap({ direction = "r" }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 2, direction = "up" },
	action = hl.dsp.window.swap({ direction = "u" }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 2, direction = "down" },
	action = hl.dsp.window.swap({ direction = "d" }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 3, direction = "up" },
	action = actions.scoped.workspace(actions.window.move("prev"), { exclude = { "special:stylus", "special:radio" } }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 3, direction = "down" },
	action = actions.scoped.workspace(actions.window.move("next"), { exclude = { "special:stylus", "special:radio" } }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 3, direction = "left" },
	action = actions.scoped.workspace(
		actions.window.stash({ workspace = "special" }),
		{ exclude = { "special:stylus", "special:radio" } }
	),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 3, direction = "right" },
	action = actions.scoped.workspace(
		actions.window.stash({ workspace = "+0", follow = false }),
		{ exclude = { "special:stylus", "special:radio" } }
	),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 4, direction = "up" },
	action = actions.scoped.workspace(actions.workspace.focus("next")),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 4, direction = "down" },
	action = actions.scoped.workspace(actions.workspace.focus("prev")),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 4, direction = "right" },
	action = actions.specialworkspace.start(),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 4, direction = "left" },
	action = actions.specialworkspace.stop(),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "longpress", fingers = 4 },
	action = actions.specialworkspace.toggle(),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "tap", fingers = 5 },
	action = actions.scoped.workspace(hl.dsp.exec_cmd("kitty"), { exclude = { "special:stylus", "special:radio" } }),
})

hl.plugin.hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 5, direction = "down" },
	action = actions.scoped.workspace(hl.dsp.window.close(), { exclude = { "special:stylus", "special:radio" } }),
})
