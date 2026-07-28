return function(colors)
	return {
		DiffAdd = { fg = colors.Blue20 },
		DiffChange = { fg = colors.Yellow12 },
		DiffChangeDelete = { fg = colors.Orange12 },
		DiffDelete = { fg = colors.Red12, strikethrough = true },
		DiffText = { fg = colors.Gray20 },
	}
end
