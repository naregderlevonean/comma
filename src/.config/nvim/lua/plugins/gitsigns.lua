return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = " " },
			change = { text = " " },
			delete = { text = " " },
			topdelete = { text = " " },
			changedelete = { text = " " },
			untracked = { text = " " },
		},
		signcolumn = true,
	},
	config = function(_, opts)
		local gs = require("gitsigns")
		gs.setup(opts)
		local map = vim.keymap.set
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gs.nav_hunk("next")
			end
		end, { desc = "Next Hunk" })
		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gs.nav_hunk("prev")
			end
		end, { desc = "Previous Hunk" })
		map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage Hunk" })
		map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset Hunk" })
		map("v", "<leader>hs", function()
			gs.stage_hunk({ vim.fn.line("'<"), vim.fn.line("'>") })
		end, { desc = "Stage Selection" })
		map("v", "<leader>hr", function()
			gs.reset_hunk({ vim.fn.line("'<"), vim.fn.line("'>") })
		end, { desc = "Reset Selection" })
		map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage Buffer" })
		map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset Buffer" })
		map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo Stage Hunk" })
		map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Hunk" })
		map("n", "<leader>hb", gs.blame_line, { desc = "Blame Line" })
		map("n", "<leader>hd", gs.diffthis, { desc = "Diff This" })
		map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Toggle Git Blame" })
		map("n", "<leader>tw", gs.toggle_word_diff, { desc = "Toggle Word Diff" })
	end,
}
