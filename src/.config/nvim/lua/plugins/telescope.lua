return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
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
			"<leader>fr",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "Recent Files",
		},
		{
			"<leader>fh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "Help Tags",
		},
		{
			"<leader>fd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>fs",
			function()
				require("telescope.builtin").lsp_document_symbols()
			end,
			desc = "Document Symbols",
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
			sorting_strategy = "ascending",
			prompt_prefix = "  ",
			selection_caret = "  ",
			path_display = {
				"smart",
			},
			layout_config = {
				horizontal = {
					prompt_position = "top",
					preview_width = 0.55,
				},
			},
			file_ignore_patterns = {
				"^.git/",
				"node_modules/",
				"target/",
				"dist/",
				"build/",
				"vendor/",
			},
			mappings = {
				i = {
					["<C-j>"] = "move_selection_next",
					["<C-k>"] = "move_selection_previous",
					["<C-q>"] = "send_to_qflist",
				},
				n = {
					q = "close",
				},
			},
		},
		pickers = {
			find_files = {
				hidden = true,
				find_command = {
					"rg",
					"--files",
					"--hidden",
					"--glob",
					"!**/.git/*",
				},
			},
			live_grep = {
				additional_args = function()
					return {
						"--hidden",
					}
				end,
			},
			buffers = {
				sort_mru = true,
				ignore_current_buffer = true,
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_file_sorter = true,
				override_generic_sorter = true,
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
