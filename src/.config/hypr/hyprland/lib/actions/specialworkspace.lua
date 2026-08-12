local M = {}

local function active()
	return hl.get_active_special_workspace() ~= nil
end

local function enter(name)
	hl.dispatch(hl.dsp.workspace.toggle_special(name or ""))
end

local function leave()
	hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
end

local function callback(value, name)
	if type(value) == "table" then
		return value[name]
	end

	return value
end

function M.start(name, callback)
	return function()
		if active() then
			return
		end

		enter(name)

		if type(callback) == "function" then
			callback()
		end
	end
end

function M.stop(callback)
	return function()
		if not active() then
			return
		end

		leave()

		if type(callback) == "function" then
			callback()
		end
	end
end

function M.toggle(name, callbacks)
	return function()
		local state

		if active() then
			leave()
			state = "stop"
		else
			enter(name)
			state = "start"
		end

		local callback = callback(callbacks, state)

		if type(callback) == "function" then
			callback()
		end
	end
end

return M
