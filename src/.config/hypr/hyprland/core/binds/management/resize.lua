local old
local color = "0xff6891ec"

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

local function stop()
	set(old, 1)
	hl.dispatch(hl.dsp.submap("reset"))
end

local function start()
	old = hl.get_config("general.col.active_border")
	set(color, 0)
	hl.dispatch(hl.dsp.submap("resize"))
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
