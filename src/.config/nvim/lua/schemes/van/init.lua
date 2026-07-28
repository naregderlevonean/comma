local colors = require("schemes.van.palette")

local modules = {
	"schemes.van.setup.code",
	"schemes.van.setup.diagnostics",
	"schemes.van.setup.differences",
	"schemes.van.setup.gitsigns",
	"schemes.van.setup.interface",
	"schemes.van.setup.nvimtree",
	"schemes.van.setup.treesitter",
}

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end

for _, file in ipairs(modules) do
	local success, generator = pcall(require, file)

	if success and type(generator) == "function" then
		local hl_groups = generator(colors)
		if type(hl_groups) == "table" then
			for group, settings in pairs(hl_groups) do
				vim.api.nvim_set_hl(0, group, settings)
			end
		end
	elseif not success then
		vim.notify("Error " .. file .. ": " .. tostring(generator), vim.log.levels.WARN)
	end
end

return colors
