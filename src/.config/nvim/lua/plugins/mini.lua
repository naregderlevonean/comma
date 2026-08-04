return {
	"echasnovski/mini.nvim",
	keys = {
		{ "ga", mode = { "n", "x" } },
		{ "gA", mode = { "n", "x" } },
	},
	config = function()
		require("mini.align").setup()
	end,
}
