return function(colors)
	return {
		DiffAdd = { fg = colors.blue[20] },
		DiffChange = { fg = colors.coral[16] },
		DiffChangeDelete = { fg = colors.orange[12] },
		DiffDelete = { fg = colors.red[8], strikethrough = true },
		DiffText = { fg = colors.gray[20] },
	}
end
