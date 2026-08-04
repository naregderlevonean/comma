return {
	"David-Kunz/gen.nvim",
	cmd = "Gen",
	keys = {
		{
			"<leader>ai",
			function()
				vim.cmd.Gen()
			end,
			desc = "AI Generate",
			silent = true,
		},
	},
	opts = {
		model = "qwen2.5-coder:7b",
		quit_map = "q",
		display_mode = "float",
		show_model = true,
		no_auto_close = true,
	},
}
