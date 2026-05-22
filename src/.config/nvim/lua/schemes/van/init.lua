local core = require("schemes.van.core")
local ts = require("schemes.van.ts")

for group, opts in pairs(core) do
    vim.api.nvim_set_hl(0, group, opts)
end

for group, opts in pairs(ts) do
    vim.api.nvim_set_hl(0, group, opts)
end

