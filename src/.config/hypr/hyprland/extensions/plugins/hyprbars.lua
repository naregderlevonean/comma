local hyprbars = {}

hl.config({
	plugin = {
		hyprbars = {
			bar_blur = false,
			bar_button_padding = 0,
			bar_buttons_alignment = "right",
			bar_color = 0x4cf8f8f8,
			bar_height = 12,
			bar_padding = 24,
			bar_part_of_window = true,
			bar_precedence_over_border = true,
			bar_text_align = "left",
			bar_text_font = "Ubuntu Sans Mono",
			bar_text_size = 13,
			bar_title_enabled = false,
			col = {
				text = 0xf7f8f8f8,
			},
			enabled = true,
			icon_on_hover = true,
			inactive_button_color = nil,
			on_double_click = "hyprctl eval 'hl.dispatch(hl.dsp.layout(\"colresize +conf\"))'",
		},
	},
})

function update(config)
	hl.config({
		plugin = {
			hyprbars = config,
		},
	})
end

function hyprbars.toggle()
	if hl.get_config("plugin.hyprbars.enabled") == true then
		hyprbars.update({ enabled = false })
	else
		hyprbars.update({ enabled = true })
	end
end

hl.bind("SUPER + CTRL + H", hyprbars.toggle)

return hyprbars
