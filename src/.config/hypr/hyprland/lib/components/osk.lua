local M = {}

local process = "wvkbd-mobintl"
local arguments = " -H 320 -L 320 -R 16 -alpha 255"
	.. " --fn 'Ubuntu Sans Mono 10'"
	.. " --bg '080808' --fg '131313' --fg-sp '1a1a1a'"
	.. " --press '1a1a1a' --press-sp '1a1a1a'"
	.. " --swipe '212121' --swipe-sp '292929'"
	.. " --text 'ededed' --text-sp 'ededed'"
	.. " -l simple,cyrillic,emoji"

function M.show()
	return function()
		hl.exec_cmd("pkill -SIGUSR1 " .. process)
	end
end

function M.hide()
	return function()
		hl.exec_cmd("pkill -SIGUSR2 " .. process)
	end
end

function M.shift()
	return function()
		hl.exec_cmd("pkill -SIGRTMIN " .. process)
	end
end

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
