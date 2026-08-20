local map = vim.keymap.set

-- Save
local function save()
	vim.cmd.write()
end

map({ "n", "i" }, "<C-s>", save, {
	desc = "Save File",
})

map("n", "<Esc>", "<cmd>nohlsearch<CR>", {
	desc = "Clear search highlight",
})
