local M = {}
local process = "walker"

local function command(arguments)
	local provider = type(arguments) == "table" and arguments.provider
		or (type(arguments) == "string" and arguments or nil)
	return provider and provider ~= "" and process .. " --provider " .. provider or process
end

function M.start(arguments)
	return function()
		system.process.start(command(arguments))
	end
end

function M.stop(arguments)
	return function()
		system.process.stop(command(arguments))
	end
end

function M.toggle(arguments)
	return function()
		system.process.toggle(command(arguments))
	end
end

return M
