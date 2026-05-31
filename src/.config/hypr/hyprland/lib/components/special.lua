local M = {}

function M.start(name)
    return function()
        hl.dispatch(hl.dsp.workspace.toggle_special(name))
    end
end

function M.stop()
    return function()
        if hl.get_active_workspace() then
            hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
        end
    end
end

function M.toggle(name)
    return function()
        if hl.get_active_workspace() then
            hl.dispatch(hl.dsp.focus({ workspace = "+0" }))
        else
            hl.dispatch(hl.dsp.workspace.toggle_special(name))
        end
    end
end

return M

