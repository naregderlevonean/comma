return {
	"echasnovski/mini.nvim",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		align = {
			enabled = true,
			mappings = { start = "ga", start_with_preview = "gA" },
		},
	},
	config = function(_, opts)
		require("mini.align").setup(opts.align)
	end,
}
