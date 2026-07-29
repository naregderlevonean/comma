return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
		{ "<leader>fE", "<cmd>NvimTreeFindFile<CR>", desc = "Find Current File" },
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function(data)
				if data.file == "" or vim.fn.isdirectory(data.file) == 0 then
					return
				end

				vim.api.nvim_set_current_dir(data.file)
				require("nvim-tree.api").tree.open()
			end,
		})
	end,
	opts = {
		hijack_netrw = true,
		sync_root_with_cwd = true,
		respect_buf_cwd = true,
		view = {
			side = "left",
			width = 32,
			preserve_window_proportions = true,
		},
		renderer = {
			group_empty = true,
			highlight_git = true,
			highlight_opened_files = "icon",
			icons = {
				show = {
					file = false,
					folder = true,
					folder_arrow = false,
					git = false,
					modified = false,
					hidden = false,
					diagnostics = false,
					bookmarks = false,
				},
				glyphs = {
					folder = {
						default = "",
						open = "",
						empty = "",
						empty_open = "",
					},
				},
				git_placement = "before",
				modified_placement = "after",
				hidden_placement = "after",
				diagnostics_placement = "signcolumn",
				bookmarks_placement = "signcolumn",
				padding = {
					icon = " ",
					folder_arrow = " ",
				},
				symlink_arrow = " ➛ ",
				web_devicons = {
					file = {
						enable = true,
						color = true,
					},
					folder = {
						enable = false,
						color = true,
					},
				},
			},
		},
		update_focused_file = {
			enable = true,
			update_root = true,
			ignore_list = {},
		},
		filters = {
			dotfiles = false,
			custom = {
				"^%.git$",
				"^%.cache$",
				"^node_modules$",
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = " ",
				info = " ",
				warning = " ",
				error = " ",
			},
		},
		git = {
			enable = true,
			ignore = false,
		},
		filesystem_watchers = {
			enable = true,
		},
		actions = {
			open_file = {
				quit_on_open = false,
				resize_window = true,
			},
		},
	},
}
