return {
	"David-Kunz/gen.nvim",
	lazy = false,
	config = function()
		require("gen").setup({
			model = "qwen",
			quit_map = "q",
			display_mode = "float",
			show_model = true,
			no_auto_close = true,
			init = function()
				pcall(io.popen, "ollama list")
			end,
		})
	end,
}
