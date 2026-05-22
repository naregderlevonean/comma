local M = {}

local queue_items = {}
local head_idx = 1
local tail_idx = 1
local is_processing = false

local function process_queue()
    if head_idx >= tail_idx then
        queue_items = {}
        head_idx = 1
        tail_idx = 1
        is_processing = false
        return
    end
    
    is_processing = true
    local task = queue_items[head_idx]
    queue_items[head_idx] = nil
    head_idx = head_idx + 1
    
    if task.type == "config" then
        hl.config(task.value)
    elseif task.type == "dispatch" then
        hl.dsp.exec_cmd(task.value)
    elseif task.type == "exec" then
        hl.exec_cmd(task.value)
    end
    
    local timeout = type(task.delay) == "number" and task.delay or 50
    hl.timer(process_queue, { timeout = timeout, type = "oneshot" })
end

local function enqueue(task_type, payload, delay)
    queue_items[tail_idx] = { type = task_type, value = payload, delay = delay }
    tail_idx = tail_idx + 1
    
    if not is_processing then
        process_queue()
    end
end

function M.config(cfg_table, delay)
    enqueue("config", cfg_table, delay)
end

function M.dispatch(payload, delay)
    enqueue("dispatch", payload, delay)
end

function M.exec(payload, delay)
    enqueue("exec", payload, delay)
end

return M

