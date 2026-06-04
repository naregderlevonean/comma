local M = {}

local function uptime()
	local file = io.open("/proc/uptime", "r")
	if not file then
		return 0
	end
	local line = file:read("*l")
	file:close()
	return tonumber(line and line:match("^([%d%.]+)")) or 0
end

function M.double(action, delay)
	local limit = (delay or 200) / 1000
	local past = 0

	return function()
		local current = uptime()
		local delta = current - past

		if delta < limit and delta > 0.02 then
			past = 0

			if type(action) == "function" then
				action()
			else
				hl.dispatch(action)
			end
		else
			past = current
		end
	end
end

return M
