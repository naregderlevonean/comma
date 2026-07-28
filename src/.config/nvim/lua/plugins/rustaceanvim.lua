return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	lazy = false,
	init = function()
		vim.g.rustaceanvim = {
			server = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
		}
	end,
}
