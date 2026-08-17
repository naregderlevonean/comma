local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = {
			corner = 4,
			edge = 4,
		},
	},
})

local scoped = actions.scoped.workspace

local walker = scoped(components.walker.toggle(), { special = true })
local windows = scoped(components.walker.toggle({ provider = "windows" }), { special = true })
local fit = scoped(actions.window.fit(), { special = true })
local focusnext = scoped(actions.window.focus("r"), { special = true })
local focusprev = scoped(actions.window.focus("l"), { special = true })
local workspacenext = scoped(actions.workspace.focus("next"))
local workspaceprev = scoped(actions.workspace.focus("prev"))
local specialworkspace = actions.specialworkspace.toggle()

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
		hl.dispatch(scoped(hl.dsp.window.close(), { special = true }))
	end
end

-- Overview

mousetrap.bind("top-right", scoped(hyprexpo, { special = true }), { delay = 300 })

-- Walker

mousetrap.bind("top-left", walker, { delay = 500 })
mousetrap.bind("bottom-right", windows, { delay = 500 })

-- Process

mousetrap.bind("bottom", killactive, { delay = 300 })

-- Workspace

mousetrap.bind("right", workspacenext, { direction = "up", distance = 500, loop = true })
mousetrap.bind("right", workspaceprev, { direction = "down", distance = 500, loop = true })

mousetrap.bind("right", function()
	hl.bind("mouse_up", workspaceprev)
	hl.bind("mouse_down", workspacenext)
end)

mousetrap.bind("right", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, { exit = true })

-- Special Workspace

mousetrap.bind("bottom-left", specialworkspace, { delay = 500 })

-- Fit

mousetrap.bind("left", fit, { flick = 100 })

-- Window

mousetrap.bind("bottom", focusnext, { direction = "left", distance = 500, loop = true })
mousetrap.bind("bottom", focusprev, { direction = "right", distance = 500, loop = true })

mousetrap.bind("bottom", function()
	hl.bind("mouse_up", focusprev)
	hl.bind("mouse_down", focusnext)
end)

mousetrap.bind("bottom", function()
	hl.unbind("mouse_up")
	hl.unbind("mouse_down")
end, { exit = true })

return mousetrap
