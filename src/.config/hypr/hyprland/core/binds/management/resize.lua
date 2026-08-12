local old
local color = "0xf7b69b2b"

local function set(border, mouse)
	hl.config({
		general = {
			col = {
				active_border = border,
			},
		},
		input = {
			follow_mouse = mouse,
		},
	})
end

local function move(x, y)
	return hl.dsp.window.resize({
		x = x,
		y = y,
		relative = true,
	})
end

local function enter()
	old = hl.get_config("general.col.active_border")
	set(color, 0)
end

local function exit()
	set(old, 1)
end

local function start()
	enter()
	hl.dispatch(hl.dsp.submap("resize"))
end

local function stop()
	exit()
	hl.dispatch(hl.dsp.submap("reset"))
end

hl.bind("SUPER + CTRL + R", start)

hl.define_submap("resize", function()
	hl.bind("Down", move(0, 1), { repeating = true })
	hl.bind("Left", move(-1, 0), { repeating = true })
	hl.bind("Right", move(1, 0), { repeating = true })
	hl.bind("Up", move(0, -1), { repeating = true })

	hl.bind("SHIFT + Down", move(0, 10), { repeating = true })
	hl.bind("SHIFT + Left", move(-10, 0), { repeating = true })
	hl.bind("SHIFT + Right", move(10, 0), { repeating = true })
	hl.bind("SHIFT + Up", move(0, -10), { repeating = true })

	hl.bind("Escape", stop)
	hl.bind("Return", stop)
	hl.bind("catchall", hl.dsp.no_op())
end)

hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {
	mouse = true,
})

hl.bind("SUPER + mouse:273", enter, {
	mouse = true,
	passthrough = true,
})

hl.bind("SUPER + mouse:273", exit, {
	mouse = true,
	release = true,
})
