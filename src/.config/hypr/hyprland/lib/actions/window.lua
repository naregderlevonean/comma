local M = {}

function M.movetoworkspace(target, options)
	local opts = options or {}
	local follow = opts.follow

	if follow == nil then
		follow = true
	end

	return function()
		if not target then
			return
		end

		hl.dispatch(hl.dsp.window.move({
			workspace = target,
			follow = follow,
		}))
	end
end

function M.movetoworkspacedirection(direction, options)
	local opts = options or {}
	local follow = opts.follow

	if follow == nil then
		follow = true
	end

	return function()
		local workspace = actions.workspace.compute(direction)

		if workspace then
			hl.dispatch(hl.dsp.window.move({
				workspace = workspace,
				follow = follow,
			}))
		end
	end
end

function M.float(options)
	local opts = options or {}
	local width = opts.width or 1200
	local height = opts.height or 800

	return function()
		local win = hl.get_active_window()

		if not win then
			return
		end

		hl.dispatch(hl.dsp.window.float({ action = "toggle" }))

		if not win.floating then
			hl.dispatch(hl.dsp.window.resize({
				x = width,
				y = height,
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
