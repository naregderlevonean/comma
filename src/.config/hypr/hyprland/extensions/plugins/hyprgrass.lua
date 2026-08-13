local hyprgrass = hl.plugin.hyprgrass
local layout = hl.dsp.layout

local scoped = actions.scoped.workspace
local swap = actions.window.swap
local movetoworkspace = actions.window.movetoworkspace
local movetoworkspacedirection = actions.window.movetoworkspacedirection
local workspace = actions.workspace.focus
local specialworkspace = actions.specialworkspace

local workspaceprev = workspace("prev")
local workspacenext = workspace("next")

local movetoworkspacedirectionprev = movetoworkspacedirection("prev")
local movetoworkspacedirectionnext = movetoworkspacedirection("next")

local movetospecial = movetoworkspace("special:special")
local movefromspecial = movetoworkspace("+0")

local specialworkspacestart = specialworkspace.start()
local specialworkspacestop = specialworkspace.stop()

local fit = scoped(actions.window.fit(), { special = true })
local kitty = scoped(hl.dsp.exec_cmd("kitty"), { special = true })
local close = scoped(hl.dsp.window.close(), { special = true })

hl.config({
	plugin = {
		hyprgrass = {
			sensitivity = 1.0,
			long_press_delay = 500,
			resize_on_border_long_press = true,
			edge_margin = 4,
		},
	},
})

-- Focus

hyprgrass.bind({
	pattern = { kind = "edge", origin = "l", direction = "r" },
	action = layout("move -col"),
})

hyprgrass.bind({
	pattern = { kind = "edge", origin = "r", direction = "l" },
	action = layout("move +col"),
})

-- OSK

hyprgrass.bind({
	pattern = { kind = "edge", origin = "u", direction = "d" },
	action = components.osk.stop(),
})

hyprgrass.bind({
	pattern = { kind = "edge", origin = "d", direction = "u" },
	action = components.osk.start(),
})

-- Swap

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 2, direction = "left" },
	action = swap("l"),
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 2, direction = "right" },
	action = swap("r"),
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 2, direction = "up" },
	action = swap("u"),
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 2, direction = "down" },
	action = swap("d"),
})

-- Move to Workspace

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 3, direction = "up" },
	action = movetoworkspacedirectionprev,
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 3, direction = "down" },
	action = movetoworkspacedirectionnext,
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 3, direction = "left" },
	action = movetospecial,
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 3, direction = "right" },
	action = movefromspecial,
})

hyprgrass.bind({
	pattern = { kind = "tap", fingers = 3 },
	action = fit,
})

-- Workspace

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 4, direction = "up" },
	action = workspacenext,
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 4, direction = "down" },
	action = workspaceprev,
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 4, direction = "right" },
	action = specialworkspacestart,
})

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 4, direction = "left" },
	action = specialworkspacestop,
})

-- Kitty

hyprgrass.bind({
	pattern = { kind = "tap", fingers = 5 },
	action = kitty,
})

-- Close

hyprgrass.bind({
	pattern = { kind = "swipe", fingers = 5, direction = "down" },
	action = close,
})
