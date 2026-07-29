return {
	"echasnovski/mini.nvim",
	keys = {
		{ "ga", mode = { "n", "x" } },
		{ "gA", mode = { "n", "x" } },
	},
	opts = {
		mappings = {
			start = "ga",
			start_with_preview = "gA",
		},
	},
	config = function(_, opts)
		require("mini.align").setup(opts)
	end,
}
