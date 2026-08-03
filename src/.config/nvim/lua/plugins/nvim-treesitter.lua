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
		matchup = {
			enable = true,
		},
	},

	config = function(_, opts)
		local ts = require("nvim-treesitter")

		ts.setup(opts)

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ok, lang = pcall(vim.treesitter.language.get_lang, args.match)

				if ok and lang then
					pcall(vim.treesitter.start, args.buf, lang)
				end
			end,
		})
	end,
}
