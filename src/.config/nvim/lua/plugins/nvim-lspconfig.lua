return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_lsp.default_capabilities()

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local bufnr = args.buf
				local bufopts = { silent = true, buffer = bufnr }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
			end,
		})

		local servers = { "lua_ls", "ts_ls", "html", "cssls" }

		for _, lsp in ipairs(servers) do
			local config = vim.lsp.config[lsp]
			if config then
				config.capabilities = vim.tbl_deep_extend("force", config.capabilities or {}, capabilities)

				vim.lsp.enable(lsp)
			end
		end
	end,
}
