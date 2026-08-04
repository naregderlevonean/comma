return {
	"chentoast/marks.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		default_mappings = true,
		signs = true,
		sign_priority = 50,
		refresh_interval = 250,
		excluded_filetypes = {
			"alpha",
			"checkhealth",
			"dashboard",
			"help",
			"lazy",
			"lspinfo",
			"man",
			"mason",
			"neo-tree",
			"NvimTree",
			"TelescopePrompt",
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
