local M = {}

do
    math.randomseed(math.floor(os.time() + (os.clock() * 1000000)))
    for _ = 1, 3 do math.random() end
end

function M.file(directory)
    if not directory or directory == "" then return nil end
    
    local command = string.format('find %s -maxdepth 1 -type f 2>/dev/null | shuf -n 1', base.string.escape(directory))
    local pipe = io.popen(command)
    if not pipe then return nil end
    
    local result = pipe:read("*l")
    pipe:close()
    
    return (result and result ~= "") and result or nil
end

function M.item(collection)
    if type(collection) ~= "table" or #collection == 0 then return nil end
    return collection[math.random(#collection)]
end

return M
