return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"bash",
			"json",
			"yaml",
			"toml",
			"html",
			"css",
			"javascript",
			"typescript",
			"tsx",
			"rust",
			"markdown",
			"markdown_inline",
			"dockerfile",
			"gitignore",
			"regex",
		},
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
				if lang then
					pcall(vim.treesitter.start, args.buf, lang)
				end
			end,
		})
		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
}
