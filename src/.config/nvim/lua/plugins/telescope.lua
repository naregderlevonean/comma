return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
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
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "Keymaps",
		},
	},
	opts = {
		defaults = {
			layout_strategy = "horizontal",
			layout_config = { horizontal = { preview_width = 0.55 } },
			sorting_strategy = "ascending",
			prompt_prefix = "  ",
			selection_caret = "  ",
			path_display = "smart",
			dynamic_preview_title = true,
			file_ignore_patterns = { "node_modules", "%.git/", "target/", "dist/", "build/", "vendor/", "%.cache/" },
			vimgrep_arguments = {
				"rg",
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
				"--smart-case",
				"--hidden",
				"--glob",
				"!**/.git/*",
				"--glob",
				"!**/node_modules/*",
			},
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<C-q>"] = "send_to_qflist",
				},
				n = { ["q"] = "close" },
			},
		},
		pickers = {
			find_files = { hidden = true },
			buffers = { sort_mru = true, ignore_current_buffer = true },
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case",
			},
		},
	},
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
	end,
}
