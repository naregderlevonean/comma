local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = {
			corner = 4,
			edge = 4,
		},
	},
})

-- Wrappers

local function scoped(code)
	return actions.scoped.workspace(code, {
		exclude = {
			"special:stylus",
			"special:radio",
		},
	})
end

-- Actions

local function hyprexpo()
	if hl.get_current_submap() == "hyprexpo" then
		hl.dispatch(plugins.hyprexpo.stop())
	else
		hl.dispatch(plugins.hyprexpo.start())
	end
end

local function killactive()
	local window = hl.get_active_window()

	if window and window.floating then
		hl.dispatch(scoped(hl.dsp.window.close()))
	end
end

-- Cached actions

local walker = components.walker.toggle()
local windows = components.walker.toggle({ provider = "windows" })

local fit = scoped(actions.window.fit())

local focus_right = scoped(actions.window.focus("r"))
local focus_left = scoped(actions.window.focus("l"))

local workspace_next = scoped(actions.workspace.focus("next"))
local workspace_prev = scoped(actions.workspace.focus("prev"))

local special_workspace = actions.specialworkspace.toggle()

-- Overview

mousetrap.bind("top-right", scoped(hyprexpo), {
	delay = 200,
})

-- Walker

mousetrap.bind("top-left", scoped(walker))
mousetrap.bind("bottom-right", scoped(windows))

-- Process

mousetrap.bind("bottom", killactive, {
	delay = 500,
})

-- Workspace

mousetrap.bind("right", workspace_next, {
	direction = "up",
	distance = 500,
	loop = true,
})

mousetrap.bind("right", workspace_prev, {
	direction = "down",
	distance = 500,
	loop = true,
})

mousetrap.bind("right", function()
	hl.bind("mouse_up", workspace_prev)
	hl.bind("mouse_down", workspace_next)
end)

mousetrap.bind("right", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

mousetrap.bind("bottom-left", special_workspace, {
	delay = 500,
})

-- Layout

mousetrap.bind("left", function()
	hl.dispatch(fit)
end, {
	flick = 100,
})

-- Window

mousetrap.bind("bottom", focus_right, {
	direction = "left",
	distance = 500,
	loop = true,
})

mousetrap.bind("bottom", focus_left, {
	direction = "right",
	distance = 500,
	loop = true,
})

mousetrap.bind("bottom", function()
	hl.bind("mouse_up", focus_right)
	hl.bind("mouse_down", focus_left)
end)

mousetrap.bind("bottom", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

return mousetrap
