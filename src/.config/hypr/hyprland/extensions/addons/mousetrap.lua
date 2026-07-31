local addon = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = {
			corner = 2,
			edge = 2,
		},
	},
})

addon.bind("right", actions.scoped.workspace(actions.workspace.focus("prev")), {
	direction = "up",
	distance = 300,
	loop = true,
})

addon.bind("right", actions.scoped.workspace(actions.workspace.focus("next")), {
	direction = "down",
	distance = 300,
	loop = true,
})

addon.bind("bottom", actions.window.focus("l"), {
	direction = "left",
	distance = 300,
	loop = true,
})

addon.bind("bottom", actions.window.focus("r"), {
	direction = "right",
	distance = 300,
	loop = true,
})

--
-- addon.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), {
-- 	delay = 500,
-- 	loop = true,
-- })
--
-- addon.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), {
-- 	delay = 500,
-- 	loop = true,
-- })
--
-- addon.bind("left", actions.window.focus("l"), {
-- 	delay = 500,
-- 	loop = true,
-- })
--
-- addon.bind("right", actions.window.focus("r"), {
-- 	delay = 500,
-- 	loop = true,
-- })
--
-- do
-- 	local mouse_buttons = {}
-- 	local cooldown = 0.15
--
-- 	addon.mouse_pressed = false
-- 	addon.block_until = 0
--
-- 	local function update_mouse_state()
-- 		addon.mouse_pressed = false
--
-- 		for _, pressed in pairs(mouse_buttons) do
-- 			if pressed then
-- 				addon.mouse_pressed = true
-- 				break
-- 			end
-- 		end
-- 	end
--
-- 	local function set_mouse_button(button, state)
-- 		mouse_buttons[button] = state
--
-- 		update_mouse_state()
--
-- 		if not state then
-- 			addon.block_until = os.clock() + cooldown
-- 		end
-- 	end
--
-- 	for _, button in ipairs({
-- 		272,
-- 		273,
-- 		274,
-- 	}) do
-- 		hl.bind("mouse:" .. button, function()
-- 			set_mouse_button(button, true)
-- 		end, {
-- 			mouse = true,
-- 			non_consuming = true,
-- 			release = false,
-- 		})
--
-- 		hl.bind("mouse:" .. button, function()
-- 			set_mouse_button(button, false)
-- 		end, {
-- 			mouse = true,
-- 			non_consuming = true,
-- 			release = true,
-- 		})
-- 	end
--
-- 	local original = addon.bind
--
-- 	addon.bind = function(zone, action, opts)
-- 		local wrapped = function(...)
-- 			if not addon.mouse_pressed and os.clock() >= addon.block_until then
-- 				return action(...)
-- 			end
-- 		end
--
-- 		return original(zone, wrapped, opts)
-- 	end
-- end
--
-- do
-- 	hl.bind(
-- 		"CONTROL_L",
-- 		addon.modifiers({
-- 			ctrl = true,
-- 		})
-- 	)
--
-- 	hl.bind(
-- 		"CONTROL + CONTROL_L",
-- 		addon.modifiers({
-- 			ctrl = false,
-- 		}),
-- 		{
-- 			release = true,
-- 		}
-- 	)
--
-- 	addon.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), {
-- 		delay = 300,
-- 		loop = true,
-- 		modifiers = {
-- 			ctrl = true,
-- 		},
-- 	})
--
-- 	addon.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), {
-- 		delay = 300,
-- 		loop = true,
-- 		modifiers = {
-- 			ctrl = true,
-- 		},
-- 	})
--
-- 	addon.bind("left", actions.window.focus("l"), {
-- 		delay = 300,
-- 		loop = true,
-- 		modifiers = {
-- 			ctrl = true,
-- 		},
-- 	})
--
-- 	addon.bind("right", actions.window.focus("r"), {
-- 		delay = 300,
-- 		loop = true,
-- 		modifiers = {
-- 			ctrl = true,
-- 		},
-- 	})
-- end
--
-- addon.bind("top-left", components.walker.toggle(), {
-- 	delay = 500,
-- })
--
-- addon.bind(
-- 	"bottom-right",
-- 	components.walker.toggle({
-- 		provider = "windows",
-- 	}),
-- 	{
-- 		delay = 500,
-- 	}
-- )
--
-- addon.bind("bottom-left", actions.specialworkspace.toggle(), {
-- 	delay = 500,
-- })

addons.mousetrap = addon
