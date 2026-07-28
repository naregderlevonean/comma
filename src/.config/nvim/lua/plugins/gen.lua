return {
	"David-Kunz/gen.nvim",
	cmd = { "Gen" },
	keys = {
		{ "<leader>ai", "<cmd>Gen<cr>", desc = "AI Generate" },
	},
	opts = {
		model = "qwen",
		quit_map = "q",
		display_mode = "float",
		show_model = true,
		no_auto_close = true,
		init = function()
			vim.system({ "ollama", "list" }, { text = true }, function() end)
		end,
	},
}
