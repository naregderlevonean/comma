local M = {}

local scale = {
	default = 1.5,
	current = 1.5,
	minimum = 1.0,
	maximum = 3.0,
	step = 0.5,
}

local function adjust(value)
	if value < scale.minimum then
		value = scale.minimum
	end
	if value > scale.maximum then
		value = scale.maximum
	end

	value = math.floor(value * 100 + 0.5) / 100

	scale.current = value

	hl.monitor({
		output = MONITOR,
		scale = scale.current,
	})
end

function M.up()
	return function()
		adjust(scale.current + scale.step)
	end
end

function M.down()
	return function()
		adjust(scale.current - scale.step)
	end
end

function M.reset()
	return function()
		adjust(scale.default)
	end
end

return M
