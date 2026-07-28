return {
	"stevearc/conform.nvim",

	event = {
		"BufWritePre",
	},

	cmd = {
		"ConformInfo",
	},

	opts = {
		notify_on_error = true,

		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},

		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			javascript = { "prettierd", "prettier" },
			javascriptreact = { "prettierd", "prettier" },
			typescript = { "prettierd", "prettier" },
			typescriptreact = { "prettierd", "prettier" },
			json = { "prettierd", "prettier" },
			html = { "prettierd", "prettier" },
			css = { "prettierd", "prettier" },
			yaml = { "prettierd", "prettier" },
			markdown = { "prettierd", "prettier" },
			sh = { "shfmt" },
		},
	},
}
