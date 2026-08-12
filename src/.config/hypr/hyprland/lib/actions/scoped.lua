local M = {}

local DEFAULT = {
	"special:radio",
	"special:stylus",
}

local function state()
	local special = hl.get_active_special_workspace()

	return {
		special = special,
		name = special and special.name or nil,
	}
end

local function matches(value, current)
	if type(value) == "table" then
		for _, item in ipairs(value) do
			if item == current then
				return true
			end
		end

		return false
	end

	return value == current
end

local function default(name)
	return matches(DEFAULT, name)
end

local function allowed(config, context)
	local special = context.name ~= nil

	if config.special == nil or config.special == false then
		return not special
	end

	if config.special == true then
		return not special or not default(context.name)
	end

	if not special then
		return false
	end

	return matches(config.special, context.name)
end

function M.workspace(action, config)
	config = config or {}

	return function()
		local context = state()

		if allowed(config, context) then
			hl.dispatch(action)
		end
	end
end

return M
