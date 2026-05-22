local M = {}

function M.init()
    components.waybar.stop()()
    hl.config({
        animations = {
            enabled = false,
        },
        decoration = {
            dim_around = 1.00,
            dim_special = 1.00,
            rounding = 0,
            rounding_power = 0.0,
            screen_shader = "",
            blur = {
                enabled = false,
            },
            shadow = {
                enabled = false,
            },
            glow = {
                enabled = false,
            }
        },
        general = {
            border_size = 0,
            float_gaps = 0,
            gaps_in = 0,
            gaps_out = 0,
            gaps_workspaces = 0,
            hover_icon_on_border = false,
            layout = "monocle",
        },
    })
end

return M

