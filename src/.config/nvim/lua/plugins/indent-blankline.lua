return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = { char = "┊", tab_char = "│" },
		scope = { enabled = true, show_start = true, show_end = false, injected_languages = true },
		whitespace = { remove_blankline_trail = true },
		exclude = {
			filetypes = { "help", "terminal", "lazy", "mason", "NvimTree", "neo-tree", "dashboard", "alpha" },
			buftypes = { "terminal", "nofile", "quickfix", "prompt" },
		},
	},
}
