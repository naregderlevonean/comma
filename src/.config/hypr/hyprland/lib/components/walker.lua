local M = {}
local process = "walker"

local function command(arguments)
    local provider = type(arguments) == "table" and arguments.provider or (type(arguments) == "string" and arguments or nil)
    return provider and provider ~= "" and process .. " --provider " .. provider or process
end

function M.start(arguments) 
    return function() 
        hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
        helpers.process.start(command(arguments)) 
    end 
end

function M.stop(arguments) 
    return function() 
        hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
        helpers.process.stop(command(arguments)) 
    end 
end

function M.toggle(arguments) 
    return function() 
        hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
        helpers.process.toggle(command(arguments)) 
    end 
end

return M

