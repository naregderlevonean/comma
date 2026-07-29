return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "┊",
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = true,
			show_exact_scope = true,
			injected_languages = true,
		},
		whitespace = {
			remove_blankline_trail = true,
		},
		exclude = {
			filetypes = {
				"alpha",
				"dashboard",
				"help",
				"lazy",
				"mason",
				"neo-tree",
				"NvimTree",
				"terminal",
			},
			buftypes = {
				"nofile",
				"prompt",
				"quickfix",
				"terminal",
			},
		},
	},
}
