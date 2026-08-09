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

local focusnext = scoped(actions.window.focus("r"))
local focusprev = scoped(actions.window.focus("l"))

local workspacenext = scoped(actions.workspace.focus("next"))
local workspaceprev = scoped(actions.workspace.focus("prev"))

local specialworkspace = actions.specialworkspace.toggle()

-- Overview

mousetrap.bind("top-right", scoped(hyprexpo), {
	delay = 300,
})

-- Walker

mousetrap.bind("top-left", scoped(walker), { delay = 300 })
mousetrap.bind("bottom-right", scoped(windows), { delay = 300 })

-- Process

mousetrap.bind("bottom", killactive, {
	delay = 500,
})

-- Workspace

mousetrap.bind("right", workspacenext, {
	direction = "up",
	distance = 500,
	loop = true,
})

mousetrap.bind("right", workspaceprev, {
	direction = "down",
	distance = 500,
	loop = true,
})

mousetrap.bind("right", function()
	hl.bind("mouse_up", workspaceprev)
	hl.bind("mouse_down", workspacenext)
end)

mousetrap.bind("right", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

mousetrap.bind("bottom-left", specialworkspace, {
	delay = 500,
})

-- Layout

mousetrap.bind("left", function()
	hl.dispatch(fit)
end, {
	flick = 100,
})

-- Window

mousetrap.bind("bottom", focusnext, {
	direction = "left",
	distance = 500,
	loop = true,
})

mousetrap.bind("bottom", focusprev, {
	direction = "right",
	distance = 500,
	loop = true,
})

mousetrap.bind("bottom", function()
	hl.bind("mouse_up", focusprev)
	hl.bind("mouse_down", focusnext)
end)

mousetrap.bind("bottom", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, {
	exit = true,
})

return mousetrap
