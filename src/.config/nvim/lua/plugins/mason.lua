return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = " ",
					package_pending = " ",
					package_uninstalled = " ",
				},
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
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
				"tailwindcss",
				"dockerls",
				"marksman",
				"taplo",
			},
			automatic_enable = true,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			ensure_installed = { "stylua", "prettierd", "prettier", "shfmt", "taplo" },
			auto_update = false,
			run_on_start = true,
		},
	},
}
