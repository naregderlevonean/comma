local map = vim.keymap.set

map({ "n", "i" }, "<C-s>", function()
	vim.cmd.write()
end, {
	desc = "Save File",
})

map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
	desc = "Clear Search Highlight",
})

map("n", "<F5>", "<cmd>ReloadTheme<CR>", {
	desc = "Reload Theme",
})

map("n", "<C-d>", "ggdG", {
	desc = "Delete All Lines",
})

map("n", "<C-a>", function()
	local clipboard = vim.fn.getreg("+")
	vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(clipboard, "\n"))
end, {
	desc = "Replace All with Clipboard",
})
