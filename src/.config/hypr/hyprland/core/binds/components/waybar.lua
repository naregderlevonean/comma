local status = system.process.status

local function gaps(bottom)
	hl.workspace_rule({
		workspace = "m[" .. MONITOR .. "]",
		gaps_out = {
			bottom = bottom,
			left = 16,
			right = 16,
			top = bottom,
		},
	})
end

local function waybare()
	if status("waybar") then
		hl.dispatch(components.waybar.stop())
		gaps(16)
	else
		hl.dispatch(components.waybar.start())
		gaps(80)
	end
end

hl.bind("Menu", waybare)
