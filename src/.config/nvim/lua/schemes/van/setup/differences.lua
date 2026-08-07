return function(colors)
	return {
		DiffAdd = { fg = colors.blue[20] },
		DiffChange = { fg = colors.honey[12] },
		DiffChangeDelete = { fg = colors.orange[12] },
		DiffDelete = { fg = colors.red[12], strikethrough = true },
		DiffText = { fg = colors.gray[20] },
	}
end
