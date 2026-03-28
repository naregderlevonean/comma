return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "prettierd", "prettier", stop_after_first = true },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				rust = { "rustfmt", lsp_format = "fallback" },
				css = { "prettierd", "prettier", "css_beautify" },
			},
			formatters = {
				prettier = {
					prepend_args = { "--tab-width", "4" },
				},
				jq = {
					prepend_args = { "--indent", "4" },
				},
			},
			format_on_save = true,
		})
	end,
}
