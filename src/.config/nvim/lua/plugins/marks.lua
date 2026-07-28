return {
	"chentoast/marks.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		default_mappings = true,
		signs = true,
		sign_priority = 10,
		excluded_filetypes = { "help", "lazy", "mason", "NvimTree", "neo-tree", "dashboard", "alpha", "terminal" },
		excluded_buftypes = { "nofile", "terminal", "quickfix", "prompt" },
		marks = {
			bookmark = { sign = "⚑", virt_text = "⚑", virt_line = false, annotate = false },
			cyclic = { sign = "→" },
		},
		refresh_interval = 250,
	},
}
