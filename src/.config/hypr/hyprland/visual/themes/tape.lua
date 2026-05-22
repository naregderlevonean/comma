local M = {}

function M.init()
    components.waybar.stop()
    hl.config({
        general = {
            border_size = 0,
            float_gaps = 0,
            gaps_in = 0,
            gaps_out = 0,
            gaps_workspaces = 0,
            layout = "scrolling",
        },
        decoration = {
            rounding = 0,
            rounding_power = 0,
            shadow = {
                enabled = false,
            },
            glow = {
                enabled = false,
            }
        },
        scrolling = {
            column_width = 0.800000
        }
    })
end

return M

