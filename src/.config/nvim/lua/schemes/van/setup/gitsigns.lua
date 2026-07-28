return function(colors)
	return {
		GitSignsAdd = { fg = colors.Green08 },
		GitSignsChange = { fg = colors.Yellow08 },
		GitSignsDelete = { fg = colors.Red08 },
		GitSignsTopdelete = { fg = colors.Red08 },
		GitSignsChangedelete = { fg = colors.Purple08 },
		GitSignsUntracked = { fg = colors.Gray08 },

		GitSignsAddNr = { fg = colors.Green08 },
		GitSignsChangeNr = { fg = colors.Yellow08 },
		GitSignsDeleteNr = { fg = colors.Red08 },
		GitSignsTopdeleteNr = { fg = colors.Red08 },
		GitSignsChangedeleteNr = { fg = colors.Purple08 },
		GitSignsUntrackedNr = { fg = colors.Gray08 },

		GitSignsAddLn = { fg = colors.Green08 },
		GitSignsChangeLn = { fg = colors.Yellow08 },
		GitSignsDeleteLn = { fg = colors.Red08 },
		GitSignsTopdeleteLn = { fg = colors.Red08 },
		GitSignsChangedeleteLn = { fg = colors.Purple08 },
		GitSignsUntrackedLn = { fg = colors.Gray08 },

		GitSignsCurrentLineBlame = { fg = colors.Gray24, bg = colors.Background02 },

		GitSignsPreviewAdd = { bg = colors.Green08 },
		GitSignsPreviewChange = { bg = colors.Yellow08 },
		GitSignsPreviewDelete = { bg = colors.Red08 },
	}
end
