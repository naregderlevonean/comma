local level = {
	"08",
	"30",
	"5F",
	"87",
	"BE",
	"F7",
}

local id = 16

for r = 1, 6 do
	for g = 1, 6 do
		for b = 1, 6 do
			print(
				string.format(
					"color%d = #%s%s%s",
					id,
					level[r],
					level[g],
					level[b]
				)
			)
			id = id + 1
		end
	end
end


-- grayscale 232-255
for i = 0, 23 do
	local v = math.floor(8 + i * (247 - 8) / 23)

	print(
		string.format(
			"color%d = #%02X%02X%02X",
			232 + i,
			v,
			v,
			v
		)
	)
end
