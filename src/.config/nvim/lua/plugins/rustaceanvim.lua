return {
	"mrcjkb/rustaceanvim",
	version = "^5",
	ft = "rust",
	init = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		vim.g.rustaceanvim = {
			server = {
				capabilities = capabilities,
				on_attach = function(_, buffer)
					local map = function(key, command, desc)
						vim.keymap.set("n", key, command, {
							buffer = buffer,
							silent = true,
							desc = desc,
						})
					end

					map("<leader>rr", "<cmd>RustLsp runnables<CR>", "Rust Runnables")
					map("<leader>rd", "<cmd>RustLsp debuggables<CR>", "Rust Debuggables")
					map("<leader>re", "<cmd>RustLsp explainError<CR>", "Explain Error")
					map("<leader>rm", "<cmd>RustLsp expandMacro<CR>", "Expand Macro")
				end,
				default_settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = {
							command = "clippy",
						},
						procMacro = {
							enable = true,
						},
						inlayHints = {
							bindingModeHints = {
								enable = true,
							},
							closureReturnTypeHints = {
								enable = "always",
							},
							lifetimeElisionHints = {
								enable = "skip_trivial",
							},
							reborrowHints = {
								enable = "always",
							},
						},
					},
				},
			},
		}
	end,
}
