return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	ft = { "rust" },
	init = function()
		vim.g.rustaceanvim = {
			server = {
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				on_attach = function(_, bufnr)
					local map = function(mode, lhs, rhs, desc)
						vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
					end
					map("n", "<leader>rr", "<cmd>RustLsp runnables<cr>", "Rust Runnables")
					map("n", "<leader>rd", "<cmd>RustLsp debuggables<cr>", "Rust Debuggables")
					map("n", "<leader>re", "<cmd>RustLsp explainError<cr>", "Explain Error")
					map("n", "<leader>rm", "<cmd>RustLsp expandMacro<cr>", "Expand Macro")
				end,
				default_settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = { command = "clippy" },
						procMacro = { enable = true },
						inlayHints = {
							bindingModeHints = { enable = true },
							closureReturnTypeHints = { enable = "always" },
							lifetimeElisionHints = { enable = "skip_trivial" },
							reborrowHints = { enable = "always" },
						},
					},
				},
			},
		}
	end,
}
