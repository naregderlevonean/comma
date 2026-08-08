local M = {}

local space = require("hyprland.lib.actions.workspace")

function M.focus(direction)
	return function()
		local active = hl.get_active_special_workspace() or hl.get_active_workspace()

		if active and active.tiled_layout == "monocle" then
			local action = (direction == "r") and "cyclenext" or "cycleprev"
			hl.dispatch(hl.dsp.layout(action))
		elseif active and active.tiled_layout == "scrolling" then
			local action = (direction == "r") and "move +col" or "move -col"
			hl.dispatch(hl.dsp.layout(action))
		else
			hl.dispatch(hl.dsp.focus({ direction = direction }))
		end
	end
end

function M.move(direction, options)
	return function()
		local active = hl.get_active_special_workspace() or hl.get_active_workspace()

		if active and active.tiled_layout == "scrolling" then
			local action = (direction == "r") and "swapcol r" or "swapcol l"
			hl.dispatch(hl.dsp.layout(action))
			return
		end

		local opts = options or {}
		local follow = (opts.follow ~= nil) and opts.follow or false

		local target = space.compute(direction)

		if target then
			hl.dispatch(hl.dsp.window.move({
				workspace = target,
				follow = follow,
			}))
		end
	end
end

function M.stash(options)
	local opts = options or {}
	local target = opts.workspace or "special"
	local follow = (opts.follow ~= nil) and opts.follow or true
	local callback = opts.callback

	return function()
		hl.dispatch(hl.dsp.window({
			action = "move",
			workspace = target,
			follow = follow,
		}))

		if type(callback) == "function" then
			callback()
		end
	end
end

function M.float(options)
	local opts = options or { width = 1200, height = 800 }

	return function()
		local win = hl.get_active_window()
		if not win then
			return
		end

		if win.floating then
			hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
		else
			hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
			hl.dispatch(hl.dsp.window.resize({
				x = opts.width,
				y = opts.height,
				exact = true,
			}))
			hl.dispatch(hl.dsp.window.center())
		end
	end
end

function M.fit(method)
	return function()
		local value = hl.get_config("scrolling:focus_fit_method")
		local state = tonumber(value)
		local next = method ~= nil and method or ((state == 1) and 0 or 1)

		hl.config({
			scrolling = {
				focus_fit_method = next,
			},
		})

		hl.dispatch(hl.dsp.layout(string.format("move %+d", (1 - state * 2) * 480)))
	end
end

return M
