return function(colors)
	return {
		GitSignsAdd = { fg = colors.Green16 },
		GitSignsChange = { fg = colors.Yellow16 },
		GitSignsDelete = { fg = colors.Red16 },
		GitSignsTopdelete = { fg = colors.Red16 },
		GitSignsChangedelete = { fg = colors.Purple16 },
		GitSignsUntracked = { fg = colors.Gray16 },

		GitSignsAddNr = { fg = colors.Green16 },
		GitSignsChangeNr = { fg = colors.Yellow16 },
		GitSignsDeleteNr = { fg = colors.Red16 },
		GitSignsTopdeleteNr = { fg = colors.Red16 },
		GitSignsChangedeleteNr = { fg = colors.Purple16 },
		GitSignsUntrackedNr = { fg = colors.Gray16 },

		GitSignsAddLn = { fg = colors.Green16 },
		GitSignsChangeLn = { fg = colors.Yellow16 },
		GitSignsDeleteLn = { fg = colors.Red16 },
		GitSignsTopdeleteLn = { fg = colors.Red16 },
		GitSignsChangedeleteLn = { fg = colors.Purple16 },
		GitSignsUntrackedLn = { fg = colors.Gray16 },

		GitSignsCurrentLineBlame = { fg = colors.Gray24, bg = colors.Background02 },

		GitSignsPreviewAdd = { bg = colors.Green16 },
		GitSignsPreviewChange = { bg = colors.Yellow16 },
		GitSignsPreviewDelete = { bg = colors.Red16 },
	}
end
