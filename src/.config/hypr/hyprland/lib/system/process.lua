local M = {}

function M.status(program)
	local name = program:match("%S+")
	if not name then
		return false
	end

	local pipe = io.popen("pgrep -x " .. name)
	if not pipe then
		return false
	end

	local found = pipe:read(1) ~= nil
	pipe:close()

	return found
end

function M.start(program)
	if M.status(program) then
		return
	end
	hl.exec_cmd(program .. " > /dev/null 2>&1 &")
end

function M.stop(program)
	local name = program:match("%S+")
	if not name then
		return
	end
	hl.exec_cmd("pkill -9 -x " .. name .. " 2>/dev/null")
end

function M.toggle(program)
	if M.status(program) then
		M.stop(program)
	else
		M.start(program)
	end
end

return M
