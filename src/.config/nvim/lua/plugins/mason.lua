return {
	{
		"williamboman/mason.nvim",
		cmd = {
			"Mason",
			"MasonInstall",
			"MasonUninstall",
			"MasonUpdate",
		},
		opts = {
			max_concurrent_installers = 4,
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
		dependencies = {
			"neovim/nvim-lspconfig",
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"cssls",
				"dockerls",
				"html",
				"jsonls",
				"lua_ls",
				"marksman",
				"rust_analyzer",
				"tailwindcss",
				"taplo",
				"ts_ls",
				"yamlls",
			},
			automatic_enable = true,
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"williamboman/mason.nvim",
		},
		opts = {
			ensure_installed = {
				"black",
				"clang-format",
				"goimports",
				"isort",
				"prettier",
				"prettierd",
				"shfmt",
				"stylua",
				"taplo",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000,
		},
	},
}
