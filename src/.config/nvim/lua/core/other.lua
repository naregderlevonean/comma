local groups = {
	"CursorLineNr",
	"EndOfBuffer",
	"FoldColumn",
	"LineNr",
	"NonText",
	"Normal",
	"SignColumn",
}

local function transparent()
	for _, group in ipairs(groups) do
		vim.api.nvim_set_hl(0, group, {
			bg = "NONE",
		})
	end
end

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = transparent,
})

local ok, err = pcall(vim.cmd.colorscheme, "van")

if not ok then
	vim.notify("Colorscheme error: " .. err, vim.log.levels.WARN)
end

vim.api.nvim_create_user_command("ReloadTheme", function()
	local modules = {
		"schemes.van",
		"schemes.van.colors",
		"schemes.van.init",
		"schemes.van.setup.code",
		"schemes.van.setup.diagnostics",
		"schemes.van.setup.differences",
		"schemes.van.setup.gitsigns",
		"schemes.van.setup.indent",
		"schemes.van.setup.interface",
		"schemes.van.setup.nvim-tree",
		"schemes.van.setup.treesitter",
	}

	for _, module in ipairs(modules) do
		package.loaded[module] = nil
	end

	vim.cmd.colorscheme("van")
end, {})

vim.keymap.set("n", "<F5>", "<cmd>ReloadTheme<CR>", {
	desc = "Reload Theme",
})
