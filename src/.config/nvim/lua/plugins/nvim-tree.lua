return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{
			"<leader>d",
			function()
				require("nvim-tree.api").tree.toggle()
			end,
			desc = "Toggle File Explorer",
		},
		{
			"<leader>fE",
			function()
				require("nvim-tree.api").tree.find_file()
			end,
			desc = "Find Current File",
		},
		{
			"<leader>fP",
			function()
				local node = require("nvim-tree.api").tree.get_node_under_cursor()
				if node and node.absolute_path then
					vim.fn.setreg("+", node.absolute_path)
					vim.notify("Copied tree path: " .. node.absolute_path, vim.log.levels.INFO)
				else
					vim.notify("No file selected in tree", vim.log.levels.WARN)
				end
			end,
			desc = "Copy Current Tree Node Path",
		},
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function(data)
				if data.file == "" or vim.fn.isdirectory(data.file) == 0 then
					return
				end

				vim.fn.chdir(data.file)
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
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
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
				symlink_arrow = "   ",
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
