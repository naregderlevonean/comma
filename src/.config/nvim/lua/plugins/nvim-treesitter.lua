return {
	"nvim-treesitter/nvim-treesitter",

	build = ":TSUpdate",

	event = { "BufReadPost", "BufNewFile" },

	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"json",
			"yaml",
			"toml",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"rust",
			"markdown",
			"markdown_inline",
		},

		auto_install = true,

		highlight = {
			enable = true,
		},

		indent = {
			enable = true,
		},
	},
}
