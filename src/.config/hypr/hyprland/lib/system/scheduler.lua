local M = {}

local types = {}
local values = {}
local delays = {}

local head = 1
local tail = 1
local busy = false

local tasks = {
	config = hl.config,
	dispatch = hl.dsp.exec_cmd,
	exec = hl.exec_cmd,
}

local function run()
	if head >= tail then
		head = 1
		tail = 1
		busy = false
		return
	end

	busy = true

	local kind = types[head]
	local data = values[head]
	local wait = delays[head]

	types[head] = nil
	values[head] = nil
	delays[head] = nil
	head = head + 1

	local action = tasks[kind]
	if action then
		action(data)
	end

	local time = type(wait) == "number" and wait or 50
	hl.timer(run, { timeout = time, type = "oneshot" })
end

local function add(kind, data, wait)
	types[tail] = kind
	values[tail] = data
	delays[tail] = wait
	tail = tail + 1

	if not busy then
		run()
	end
end

function M.config(data, wait)
	add("config", data, wait)
end

function M.dispatch(data, wait)
	add("dispatch", data, wait)
end

function M.exec(data, wait)
	add("exec", data, wait)
end

return M
