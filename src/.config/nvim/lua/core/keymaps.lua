local map = vim.keymap.set

local save = function()
	vim.cmd.write()
end

map("n", "<C-s>", save, {
	desc = "Save File",
})

map("v", "<C-s>", function()
	vim.cmd.write()
	vim.cmd.normal("gv")
end, {
	desc = "Save File and Restore Selection",
})

map("i", "<C-s>", function()
	vim.cmd.write()
end, {
	desc = "Save File",
})
