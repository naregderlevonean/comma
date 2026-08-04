return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		indent = {
			char = "│",
			tab_char = "│",
		},
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
			show_exact_scope = true,
			injected_languages = true,
		},
		whitespace = {
			remove_blankline_trail = true,
		},
		exclude = {
			filetypes = {
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
			buftypes = {
				"nofile",
				"prompt",
				"quickfix",
				"terminal",
			},
		},
	},
}
