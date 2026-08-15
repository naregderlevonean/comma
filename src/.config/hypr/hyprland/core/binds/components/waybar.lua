local status = system.process.status

local function gaps(bottom)
	hl.workspace_rule({
		workspace = "m[" .. MONITOR .. "]",
		gaps_out = {
			bottom = bottom,
			left = 24,
			right = 24,
			top = bottom,
		},
	})
end

local function waybar()
	if status("waybar") then
		hl.dispatch(components.waybar.stop())
		gaps(24)
	else
		hl.dispatch(components.waybar.start())
		gaps(88)
	end
end

hl.bind("Menu", waybar)
