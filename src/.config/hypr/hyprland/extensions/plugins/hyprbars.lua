local hyprbars = {}

hl.config({
    plugin = {
        hyprbars = {
            enabled = false,
            bar_color = 0xff292929,
            bar_height = 6,
            bar_blur = false,
            col = {
                text = 0xffffffff,
            },
            bar_title_enabled = false,
            bar_text_size = 13,
            bar_text_font = "Ubuntu Sans Mono",
            bar_text_align = "left",
            bar_buttons_alignment = "right",
            bar_part_of_window = true,
            bar_precedence_over_border = true,
            bar_padding = 24,
            bar_button_padding = 8,
            icon_on_hover = false,
            inactive_button_color = nil,
            on_double_click = "",
        }
    },
})

function hyprbars.set(params)
    hl.config({
        plugin = {
            hyprbars = params
        }
    })
end

function hyprbars.toggle()
    if hl.get_config("plugin.hyprbars.enabled") == true then
        hyprbars.set({ enabled = false})
    else
        hyprbars.set({ enabled = true})
    end
end

hl.bind("SUPER + Escape", hyprbars.toggle)

plugins.hyprbars = hyprbars
