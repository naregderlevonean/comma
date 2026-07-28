vim.keymap.set("n", "<C-s>", "<cmd>w!<cr>", { desc = "Save File" })
vim.keymap.set("v", "<C-s>", "<Esc><cmd>w!<cr>gv", { desc = "Save File and Keep Selection" })
vim.keymap.set("i", "<C-s>", "<cmd>w<cr><cmd>stopinsert<cr>", { desc = "Save File" })

vim.keymap.set("n", "<leader>ai", "<cmd>Gen<cr>", { desc = "AI Menu" })
vim.keymap.set("v", "<leader>ai", ":<C-u>Gen<cr>", { desc = "AI for Selection" })
