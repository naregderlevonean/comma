return {
	"nvim-tree/nvim-tree.lua",
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle File Explorer" },
		{ "<leader>fE", "<cmd>NvimTreeFindFile<cr>", desc = "Find Current File" },
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function(data)
				if vim.fn.isdirectory(data.file) == 1 then
					vim.cmd.cd(data.file)
					require("nvim-tree.api").tree.open()
				end
			end,
		})
	end,
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
	opts = {
		hijack_netrw = true,
		hijack_cursor = true,
		sync_root_with_cwd = true,
		view = { width = 32, side = "left", preserve_window_proportions = true },
		renderer = {
			group_empty = true,
			icons = {
				show = {
					file = false,
					folder = false,
					folder_arrow = false,
					git = false,
					modified = false,
					hidden = false,
					diagnostics = false,
					bookmarks = false,
				},
			},
			highlight_git = true,
			highlight_opened_files = "name",
		},
		update_focused_file = { enable = true, update_root = true },
		filters = { dotfiles = false, custom = { "node_modules", "\\.cache", "\\.git" } },
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = { hint = "H", info = "I", warning = "W", error = "E" },
		},
		git = { enable = true, ignore = false },
		actions = { open_file = { quit_on_open = false, resize_window = true } },
		trash = { cmd = "trash" },
		disable_netrw = true,
		open_on_tab = false,
		respect_buf_cwd = true,
	},
}
