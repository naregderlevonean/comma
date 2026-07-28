local prettier = { "prettierd", "prettier" }

return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		notify_on_error = true,
		format_on_save = { async = false },
		default_format_opts = {
			lsp_format = "fallback",
			timeout_ms = 1000,
			stop_after_first = true,
		},
		formatters = {
			prettierd = { require_cwd = true },
		},
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			javascript = prettier,
			javascriptreact = prettier,
			typescript = prettier,
			typescriptreact = prettier,
			vue = prettier,
			json = prettier,
			jsonc = prettier,
			html = prettier,
			css = prettier,
			scss = prettier,
			less = prettier,
			yaml = prettier,
			markdown = prettier,
			graphql = prettier,
			xml = prettier,
			toml = { "taplo" },
			sh = { "shfmt" },
			bash = { "shfmt" },
		},
	},
}
