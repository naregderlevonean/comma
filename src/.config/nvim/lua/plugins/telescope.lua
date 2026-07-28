return {
	"nvim-telescope/telescope.nvim",

	cmd = "Telescope",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-fzf-native.nvim",
	},

	keys = {
		{
			"<leader>ff",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "Live Grep",
		},
		{
			"<leader>fb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Current Buffer",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Document Symbols",
		},
		{
			"<leader>fS",
			function()
				require("telescope.builtin").lsp_workspace_symbols()
			end,
			desc = "Workspace Symbols",
		},
	},

	opts = {
		defaults = {
			layout_strategy = "horizontal",
			sorting_strategy = "ascending",
			prompt_prefix = "❯ ",
			selection_caret = "➜ ",
			path_display = {
				"smart",
			},

			file_ignore_patterns = {
				"node_modules",
				".git/",
				"target/",
				"dist/",
				"build/",
			},
		},

		pickers = {
			find_files = {
				hidden = true,
			},
		},
	},

	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		pcall(telescope.load_extension, "fzf")
	end,
}
