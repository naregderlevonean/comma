local status = system.process.status

local function gaps(bottom)
	hl.workspace_rule({
		workspace = "m[" .. MONITOR .. "]",
		gaps_out = {
			bottom = bottom,
			left = 32,
			right = 32,
			top = bottom,
		},
	})
end

local function waybar()
	if status("waybar") then
		hl.dispatch(components.waybar.stop())
		gaps(32)
	else
		hl.dispatch(components.waybar.start())
		gaps(96)
	end
end

hl.bind("Menu", waybar)
