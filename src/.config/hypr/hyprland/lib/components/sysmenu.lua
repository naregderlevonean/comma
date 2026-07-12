local M = {}
local process = "sysmenu"

function M.start(arguments)
	return function()
		system.process.start(process)
	end
end

function M.stop(arguments)
	return function()
		system.process.stop(process)
	end
end

function M.toggle(arguments)
	return function()
		system.process.toggle(process)
	end
end

function M.status()
	return system.process.status(process)
end

return M
