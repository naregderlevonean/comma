local colors = require("schemes.van.palette")

local modules = {
	"schemes.van.setup.code",
	"schemes.van.setup.diagnostics",
	"schemes.van.setup.differences",
	"schemes.van.setup.gitsigns",
	"schemes.van.setup.indent",
	"schemes.van.setup.interface",
	"schemes.van.setup.nvimtree",
	"schemes.van.setup.treesitter",
}

vim.cmd.highlight("clear")

if vim.fn.exists("syntax_on") == 1 then
	vim.cmd.syntax("reset")
end

for _, module in ipairs(modules) do
	local ok, generator = pcall(require, module)

	if ok then
		for group, settings in pairs(generator(colors)) do
			vim.api.nvim_set_hl(0, group, settings)
		end
	else
		vim.notify("Van: " .. module .. ": " .. generator, vim.log.levels.WARN)
	end
end

return colors
