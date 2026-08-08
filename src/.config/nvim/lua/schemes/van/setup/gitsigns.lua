return function(colors)
	return {
		GitSignsAdd = { fg = colors.green[16] },
		GitSignsChange = { fg = colors.coral[16] },
		GitSignsDelete = { fg = colors.red[16] },
		GitSignsTopdelete = { fg = colors.red[16] },
		GitSignsChangedelete = { fg = colors.amethyst[16] },
		GitSignsUntracked = { fg = colors.gray[16] },

		GitSignsAddNr = { fg = colors.green[16] },
		GitSignsChangeNr = { fg = colors.coral[16] },
		GitSignsDeleteNr = { fg = colors.red[16] },
		GitSignsTopdeleteNr = { fg = colors.red[16] },
		GitSignsChangedeleteNr = { fg = colors.amethyst[16] },
		GitSignsUntrackedNr = { fg = colors.gray[16] },

		GitSignsAddLn = { fg = colors.green[16] },
		GitSignsChangeLn = { fg = colors.coral[16] },
		GitSignsDeleteLn = { fg = colors.red[16] },
		GitSignsTopdeleteLn = { fg = colors.red[16] },
		GitSignsChangedeleteLn = { fg = colors.amethyst[16] },
		GitSignsUntrackedLn = { fg = colors.gray[16] },

		GitSignsCurrentLineBlame = { fg = colors.gray[24], bg = colors.gray[2] },

		GitSignsPreviewAdd = { bg = colors.green[16] },
		GitSignsPreviewChange = { bg = colors.coral[16] },
		GitSignsPreviewDelete = { bg = colors.red[16] },
	}
end
