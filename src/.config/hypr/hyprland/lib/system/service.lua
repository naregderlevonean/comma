local M = {}

function M.status(service)
	local name = service:match("%S+")
	if not name then
		return false
	end

	local handle = io.popen("systemctl --user is-active " .. name .. ".service 2>/dev/null")
	if not handle then
		return false
	end

	local result = handle:read("*a")
	handle:close()

	result = result:gsub("%s+", "")

	return result == "active"
end

function M.start(service)
	local name = service:match("%S+")
	if not name then
		return
	end

	hl.exec_cmd("systemctl --user start " .. name .. ".service")
end

function M.stop(service)
	local name = service:match("%S+")
	if not name then
		return
	end

	hl.exec_cmd("systemctl --user stop " .. name .. ".service")
end

function M.toggle(service)
	local name = service:match("%S+")
	if not name then
		return
	end

	if M.status(name) then
		M.stop(name)
	else
		M.start(name)
	end
end

return M
