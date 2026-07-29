return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.diagnostic.config({
			virtual_text = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "E",
					[vim.diagnostic.severity.WARN] = "W",
					[vim.diagnostic.severity.INFO] = "I",
					[vim.diagnostic.severity.HINT] = "?",
				},
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "if_many",
			},
		})

		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local highlight = vim.api.nvim_create_augroup("lsp-highlight", { clear = true })

		vim.api.nvim_create_autocmd("LspAttach", {
			desc = "LSP keymaps",
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if not client then
					return
				end

				local bufnr = args.buf

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
					vim.lsp.buf.format({ async = false })
				end, "Format")
				map("n", "[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
				map("n", "]d", vim.diagnostic.goto_next, "Next Diagnostic")
				map("n", "<leader>e", vim.diagnostic.open_float, "Line Diagnostics")
				map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, "Add Workspace Folder")
				map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder")
				map("n", "<leader>wl", function()
					vim.print(vim.lsp.buf.list_workspace_folders())
				end, "List Workspace Folders")
				map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace Symbols")
				map("n", "<leader>lr", vim.cmd.LspRestart, "Restart LSP")

				if client:supports_method("textDocument/documentHighlight") then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						group = highlight,
						buffer = bufnr,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						group = highlight,
						buffer = bufnr,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		local base = {
			capabilities = capabilities,
		}

		local servers = {
			bashls = base,
			cssls = base,
			dockerls = base,
			html = base,
			jsonls = base,
			marksman = base,
			rust_analyzer = base,
			tailwindcss = base,
			taplo = base,
			ts_ls = base,
			yamlls = base,
			lua_ls = vim.tbl_extend("force", base, {
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
			}),
		}

		for server, config in pairs(servers) do
			vim.lsp.config(server, config)
			vim.lsp.enable(server)
		end
	end,
}
