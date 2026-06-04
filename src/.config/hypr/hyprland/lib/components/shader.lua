local M = {}

local id2path = {}
local path2id = {}
local current = 0
local total = 0
local last = 1

local function name(path)
	if not path or path == "" then
		return "None"
	end
	return path:match("([^/]+)%.glsl$") or "Unknown"
end

local function notify(path)
	local name = name(path)
	local command =
		string.format("notify-send -r 9119 -t 1500 'Hyprland' 'Shader: %s' >/dev/null 2>&1 &", base.string.escape(name))
	hl.exec_cmd(command)
end

local function apply(index)
	current = index
	if index > 0 then
		last = index
	end
	local path = id2path[index] or ""

	hl.config({ decoration = { screen_shader = path } })
	notify(path)
end

local function init()
	id2path = {}
	path2id = {}

	local dir = os.getenv("SHADERS") or (os.getenv("HOME") .. "/.config/hypr/shaders")
	local command = string.format("find %s -maxdepth 1 -name '*.glsl' | sort 2>/dev/null", base.string.escape(dir))

	local p = io.popen(command)
	if p then
		local index = 1
		for line in p:lines() do
			local path = line:match("^%s*(.-)%s*$")
			if path and path ~= "" then
				id2path[index] = path
				path2id[path] = index
				index = index + 1
			end
		end
		p:close()
	end

	total = #id2path

	if hl.get_config then
		local active = hl.get_config("decoration:screen_shader")
		current = path2id[active] or 0
		if current > 0 then
			last = current
		end
	else
		current = 0
	end
end

local function switch(step)
	if total == 0 then
		return
	end

	local next
	if current == 0 then
		next = (step > 0) and 1 or total
	else
		next = current + step
		if next > total then
			next = 1
		elseif next < 1 then
			next = total
		end
	end

	apply(next)
end

M.next = function()
	return function()
		switch(1)
	end
end

M.prev = function()
	return function()
		switch(-1)
	end
end

function M.off()
	return function()
		if current ~= 0 then
			apply(0)
		end
	end
end

function M.toggle()
	return function()
		if total == 0 then
			return
		end

		if M.status() then
			apply(0)
		else
			apply(last)
		end
	end
end

function M.status()
	return current > 0
end

init()

return M
