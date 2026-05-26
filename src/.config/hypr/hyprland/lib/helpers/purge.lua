local M = {}

function M.init()
    local windows = hl.get_windows()
    local addresses = {}

    for _, window in ipairs(windows) do
        table.insert(addresses, window.address)
    end

    for _, addr in ipairs(addresses) do
        hl.dispatch(hl.dsp.window.close({ window = "address:" .. addr }))
    end
end

return M

