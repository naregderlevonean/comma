local M = {}

do
    local function get_seed()
        local t = os.time()
        local c = os.clock() * 10000
        local ptr = tonumber(tostring({}):match("0x(%w+)"), 16) or 0
        return math.floor(t + c + ptr)
    end
    math.randomseed(get_seed())
    math.random(); math.random(); math.random()
end

function M.file(path)
    if not path or path == "" then return nil end
    local cmd = string.format('find %s -maxdepth 1 -type f 2>/dev/null | shuf -n 1', helpers.string.escape(path))
    local p = io.popen(cmd)
    if not p then return nil end
    local out = helpers.string.trim(p:read("*a") or "")
    p:close()
    return out ~= "" and out or nil
end

function M.item(list)
    if type(list) ~= "table" or #list == 0 then return nil end
    return list[math.random(#list)]
end

return M

