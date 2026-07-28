return {
	"neovim/nvim-lspconfig",

	event = {
		"BufReadPre",
		"BufNewFile",
	},

	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},

	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		local on_attach = function(_, bufnr)
			local map = function(mode, lhs, rhs, desc)
				vim.keymap.set(mode, lhs, rhs, {
					buffer = bufnr,
					silent = true,
					desc = desc,
				})
			end

			map("n", "gd", vim.lsp.buf.definition, "Goto Definition")
			map("n", "gD", vim.lsp.buf.declaration, "Goto Declaration")
			map("n", "gr", vim.lsp.buf.references, "References")
			map("n", "gi", vim.lsp.buf.implementation, "Implementation")
			map("n", "K", vim.lsp.buf.hover, "Hover")
			map("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
			map("n", "<leader>ca", vim.lsp.buf.code_action, "Code Action")
			map("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, "Format")
			map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
			map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
			map("n", "<leader>e", vim.diagnostic.open_float, "Line Diagnostics")
		end

		local servers = {
			lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},

						workspace = {
							checkThirdParty = false,
						},

						telemetry = {
							enable = false,
						},
					},
				},
			},

			rust_analyzer = {},

			ts_ls = {},

			html = {},

			cssls = {},

			jsonls = {},

			yamlls = {},

			bashls = {},
		}

		for server, config in pairs(servers) do
			config.capabilities = capabilities
			config.on_attach = on_attach

			lspconfig[server].setup(config)
		end

		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "if_many",
			},
		})
	end,
}
