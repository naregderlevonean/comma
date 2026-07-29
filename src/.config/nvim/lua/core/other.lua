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
