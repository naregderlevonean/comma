local model = "qwen2.5-coder:7b"

return {
	"David-Kunz/gen.nvim",
	cmd = "Gen",
	keys = {
		{ "<leader>ai", "<cmd>Gen<CR>", desc = "AI Generate" },
	},
	opts = {
		model = model,
		quit_map = "q",
		display_mode = "float",
		show_model = true,
		no_auto_close = true,
	},
}
