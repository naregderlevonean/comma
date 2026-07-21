local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = { corner = 2, edge = 2 },
	},
})

mousetrap.pressed = false

hl.bind("mouse:272", function()
	mousetrap.pressed = true
end, { mouse = true, non_consuming = true, release = false })

hl.bind("mouse:272", function()
	mousetrap.pressed = false
end, { mouse = true, non_consuming = true, release = true })

local original = mousetrap.bind
mousetrap.bind = function(zone, action, opts)
	local wrapped = function(...)
		if not mousetrap.pressed then
			if type(action) == "function" then
				return action(...)
			elseif type(action) == "table" and getmetatable(action) and getmetatable(action).__call then
				return action(...)
			end
		end
	end
	return original(zone, wrapped, opts)
end

mousetrap.bind("top-left", components.walker.toggle(), { delay = 500 })
mousetrap.bind("bottom-right", components.walker.toggle({ provider = "windows" }), { delay = 500 })

mousetrap.bind("bottom-left", actions.specialworkspace.toggle(), { delay = 500 })

mousetrap.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), { delay = 50 })
mousetrap.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), { delay = 50 })

mousetrap.bind("left", actions.window.focus("l"), { delay = 50 })
mousetrap.bind("right", actions.window.focus("r"), { delay = 50 })

addons.mousetrap = mousetrap
