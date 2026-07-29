local parsers = {
	"bash",
	"css",
	"dockerfile",
	"gitignore",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"markdown_inline",
	"query",
	"regex",
	"rust",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		ensure_installed = parsers,
		auto_install = true,
	},
	config = function(_, opts)
		require("nvim-treesitter").setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				if vim.bo[args.buf].buftype ~= "" then
					return
				end

				local lang = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)

				if not lang then
					return
				end

				pcall(vim.treesitter.start, args.buf, lang)
			end,
		})

		vim.opt.foldmethod = "expr"
		vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.opt.foldlevel = 99
		vim.opt.foldlevelstart = 99
	end,
}
