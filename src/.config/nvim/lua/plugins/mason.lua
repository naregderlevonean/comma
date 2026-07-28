return {
	{
		"williamboman/mason.nvim",

		cmd = "Mason",

		opts = {
			ui = {
				border = "rounded",

				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",

		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},

		opts = {
			ensure_installed = {
				"lua_ls",
				"rust_analyzer",
				"ts_ls",
				"html",
				"cssls",
				"jsonls",
				"yamlls",
				"bashls",
			},

			automatic_enable = true,
		},
	},
}
