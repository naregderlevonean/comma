local spin = require("hyprland.extensions.addons.spin.init").setup({
	interval = 500,
	devices = {
		monitors = { "eDP-1" },
		touchdevices = { "eDP-1" },
		tablets = { "eDP-1" },
	},
})

local function scrolling(width)
	if hl.get_config("general.layout") == "scrolling" then
		system.scheduler.config({ general = { layout = "monocle" } })
		system.scheduler.config({
			general = { layout = "scrolling" },
			scrolling = { column_width = width },
		})
	end
end

spin.bind({ "left-up", "right-up" }, function(orientation, transform)
	scrolling(1.000000)
end)

spin.bind({ "normal", "bottom-up" }, function(orientation, transform)
	scrolling(0.500000)
end)

addons.spin = spin
