local function git()
	return require("gitsigns")
end

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "┊" },
			topdelete = { text = "┊" },
			changedelete = { text = "┊" },
			untracked = { text = "┆" },
		},
		signs_staged = {
			add = { text = "│" },
			change = { text = "│" },
			delete = { text = "┊" },
			topdelete = { text = "┊" },
			changedelete = { text = "┊" },
			untracked = { text = "┊" },
		},
		signcolumn = true,
		numhl = false,
		linehl = false,
		word_diff = false,
		current_line_blame = false,
		current_line_blame_opts = {
			delay = 500,
			virtual_text = true,
		},
		watch_gitdir = {
			follow_files = true,
			attach_to_untracked = true,
		},
	},
	keys = {
		{
			"]c",
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "]c", bang = true })
				else
					git().nav_hunk("next")
				end
			end,
			desc = "Next Hunk",
		},
		{
			"[c",
			function()
				if vim.wo.diff then
					vim.cmd.normal({ "[c", bang = true })
				else
					git().nav_hunk("prev")
				end
			end,
			desc = "Previous Hunk",
		},
		{
			"<leader>hs",
			function()
				git().stage_hunk()
			end,
			desc = "Stage Hunk",
		},
		{
			"<leader>hr",
			function()
				git().reset_hunk()
			end,
			desc = "Reset Hunk",
		},
		{
			"<leader>hs",
			mode = "v",
			function()
				git().stage_hunk({ vim.fn.line("'<"), vim.fn.line("'>") })
			end,
			desc = "Stage Selection",
		},
		{
			"<leader>hr",
			mode = "v",
			function()
				git().reset_hunk({ vim.fn.line("'<"), vim.fn.line("'>") })
			end,
			desc = "Reset Selection",
		},
		{
			"<leader>hS",
			function()
				git().stage_buffer()
			end,
			desc = "Stage Buffer",
		},
		{
			"<leader>hR",
			function()
				git().reset_buffer()
			end,
			desc = "Reset Buffer",
		},
		{
			"<leader>hu",
			function()
				git().undo_stage_hunk()
			end,
			desc = "Undo Stage Hunk",
		},
		{
			"<leader>hp",
			function()
				git().preview_hunk()
			end,
			desc = "Preview Hunk",
		},
		{
			"<leader>hb",
			function()
				git().blame_line()
			end,
			desc = "Blame Line",
		},
		{
			"<leader>hd",
			function()
				git().diffthis()
			end,
			desc = "Diff This",
		},
		{
			"<leader>tb",
			function()
				git().toggle_current_line_blame()
			end,
			desc = "Toggle Git Blame",
		},
		{
			"<leader>tw",
			function()
				git().toggle_word_diff()
			end,
			desc = "Toggle Word Diff",
		},
		{
			"<leader>tl",
			function()
				git().toggle_linehl()
			end,
			desc = "Toggle Line Highlight",
		},
		{
			"<leader>tn",
			function()
				git().toggle_numhl()
			end,
			desc = "Toggle Num Highlight",
		},
	},
}
