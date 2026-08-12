if system.process.status("waybar") then
	hl.workspace_rule({
		workspace = "m[" .. MONITOR .. "]",
		gaps_out = {
			bottom = 80,
			left = 16,
			right = 16,
			top = 80,
		},
	})
end
