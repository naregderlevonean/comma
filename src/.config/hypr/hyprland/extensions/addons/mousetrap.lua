local mousetrap = require("hyprland.extensions.addons.mousetrap.init").setup({
	geometry = {
		default = {
			corner = 2,
			edge = 2,
		},
	},
})

mousetrap.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), {
	velocity = 100,
})

mousetrap.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), {
	velocity = 100,
})

mousetrap.bind("left", actions.window.focus("l"), {
	velocity = 100,
})

mousetrap.bind("right", actions.window.focus("r"), {
	velocity = 100,
})

do
	local mouse_buttons = {}
	local cooldown = 0.15

	mousetrap.mouse_pressed = false
	mousetrap.block_until = 0

	local function update_mouse_state()
		mousetrap.mouse_pressed = false

		for _, pressed in pairs(mouse_buttons) do
			if pressed then
				mousetrap.mouse_pressed = true
				break
			end
		end
	end

	local function set_mouse_button(button, state)
		mouse_buttons[button] = state

		update_mouse_state()

		if not state then
			mousetrap.block_until = os.clock() + cooldown
		end
	end

	for _, button in ipairs({
		272,
		273,
		274,
	}) do
		hl.bind("mouse:" .. button, function()
			set_mouse_button(button, true)
		end, {
			mouse = true,
			non_consuming = true,
			release = false,
		})

		hl.bind("mouse:" .. button, function()
			set_mouse_button(button, false)
		end, {
			mouse = true,
			non_consuming = true,
			release = true,
		})
	end

	local original = mousetrap.bind

	mousetrap.bind = function(zone, action, opts)
		local wrapped = function(...)
			if not mousetrap.mouse_pressed and os.clock() >= mousetrap.block_until then
				return action(...)
			end
		end

		return original(zone, wrapped, opts)
	end
end

do
	hl.bind(
		"CONTROL_L",
		mousetrap.modifiers({
			ctrl = true,
		})
	)

	hl.bind(
		"CONTROL + CONTROL_L",
		mousetrap.modifiers({
			ctrl = false,
		}),
		{
			release = true,
		}
	)

	mousetrap.bind("top", actions.scoped.workspace(actions.workspace.focus("prev")), {
		delay = 250,
		loop = true,
		modifiers = {
			ctrl = true,
		},
	})

	mousetrap.bind("bottom", actions.scoped.workspace(actions.workspace.focus("next")), {
		delay = 250,
		loop = true,
		modifiers = {
			ctrl = true,
		},
	})

	mousetrap.bind("left", actions.window.focus("l"), {
		delay = 250,
		loop = true,
		modifiers = {
			ctrl = true,
		},
	})

	mousetrap.bind("right", actions.window.focus("r"), {
		delay = 250,
		loop = true,
		modifiers = {
			ctrl = true,
		},
	})
end

mousetrap.bind("top-left", components.walker.toggle(), {
	delay = 500,
})

mousetrap.bind(
	"bottom-right",
	components.walker.toggle({
		provider = "windows",
	}),
	{
		delay = 500,
	}
)

mousetrap.bind("bottom-left", actions.specialworkspace.toggle(), {
	delay = 500,
})

addons.mousetrap = mousetrap
