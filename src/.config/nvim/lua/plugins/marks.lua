return {
	"chentoast/marks.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		default_mappings = true,
		signs = true,
		sign_priority = 100,
		refresh_interval = 150,
		excluded_filetypes = {
			"alpha",
			"dashboard",
			"help",
			"lazy",
			"mason",
			"neo-tree",
			"NvimTree",
			"terminal",
		},
		excluded_buftypes = {
			"nofile",
			"prompt",
			"quickfix",
			"terminal",
		},
		marks = {
			bookmark = {
				sign = "⚑",
				virt_text = "⚑",
				virt_line = false,
				annotate = false,
			},
			cyclic = {
				sign = " ",
				virt_text = " ",
			},
		},
	},
}
