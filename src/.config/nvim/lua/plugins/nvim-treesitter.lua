return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	lazy = false,
	config = function()
		require("nvim-treesitter").setup()

		require("nvim-treesitter").install({
			"lua",
			"rust",
			"typescript",
			"javascript",
			"json",
			"html",
			"css",
		})
	end,
}
