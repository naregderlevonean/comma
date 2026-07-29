return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.align").setup({
			mappings = {
				start = "ga",
				start_with_preview = "gA",
			},
		})
	end,
}
