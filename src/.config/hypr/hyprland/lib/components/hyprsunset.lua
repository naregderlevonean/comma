local M = {}

local process = "hyprsunset"
local default = 2000

function M.start(temperature)
	return function()
		local current = temperature or default
		system.process.start(string.format("%s -t %s", process, current))
	end
end

function M.stop()
	return function()
		system.process.stop(process)
	end
end

function M.toggle(temperature)
	return function()
		local current = temperature or default
		system.process.toggle(string.format("%s -t %s", process, current))
	end
end

function M.status()
	return system.process.status(process)
end

return M
