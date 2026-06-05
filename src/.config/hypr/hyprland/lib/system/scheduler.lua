
local M = {}

local type = type
local hl_timer = hl.timer

local default_timeout = 50

local queue = {}
local head = 1
local tail = 1
local busy = false

local handlers = {
	config = hl.config,
	exec = hl.exec_cmd,
	callback = function(callback)
		callback()
	end,
}

local function run()
	if head >= tail then
		head = 1
		tail = 1
		busy = false
		return
	end

	busy = true

	local task = queue[head]
	head = head + 1

	local handler = handlers[task.kind]
	if handler and task.data then
		pcall(handler, task.data)
	end

	local wait = task.wait
	
	hl_timer(run, { 
		timeout = type(wait) == "number" and wait or default_timeout, 
		type = "oneshot" 
	})
end

local function add(kind, data, wait)
	local task = queue[tail]
	if not task then
		task = {}
		queue[tail] = task
	end

	task.kind = kind
	task.data = data
	task.wait = wait

	tail = tail + 1

	if not busy then
		run()
	end
end

function M.config(data, wait)
	add("config", data, wait)
end

function M.exec(data, wait)
	add("exec", data, wait)
end

function M.callback(callback, wait)
	add("callback", callback, wait)
end

return M

