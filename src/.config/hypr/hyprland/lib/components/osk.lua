local M = {}

local process = "wvkbd-mobintl"
local arguments = "-H 320 -L 320 -R 16 -alpha 148"
	.. " --fn 'Ubuntu Sans Mono Bold 10'"
	.. " --bg '#131313' --fg '#ededed' --fg-sp '#949494'"
	.. " --press '#1a1a1a' --press-sp '#1a1a1a'"
	.. " --swipe '#212121' --swipe-sp '#292929'"
	.. " --text '#ededed' --text-sp '#949494'"
	.. " -l simple,cyrillic,emoji"

function M.start()
	return function()
		system.process.start(string.format("%s %s", process, arguments))
	end
end

function M.stop()
	return function()
		system.process.stop(process)
	end
end

function M.toggle()
	return function()
		system.process.toggle(string.format("%s %s", process, arguments))
	end
end

function M.status()
	return system.process.status(process)
end

return M
