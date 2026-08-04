local hyprbars = {}

hl.config({
	plugin = {
		hyprbars = {
			bar_blur = false,
			bar_button_padding = 8,
			bar_buttons_alignment = "right",
			bar_color = 0x49ededed,
			bar_height = 4,
			bar_padding = 24,
			bar_part_of_window = true,
			bar_precedence_over_border = true,
			bar_text_align = "left",
			bar_text_font = "Ubuntu Sans Mono",
			bar_text_size = 13,
			bar_title_enabled = false,
			col = {
				text = 0xedededff,
			},
			enabled = true,
			icon_on_hover = true,
			inactive_button_color = nil,
			on_double_click = 'hyprctl eval \'actions.scoped.workspace(hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))()\'',
		},
	},
})

function hyprbars.set(config)
	hl.config({
		plugin = {
			hyprbars = config,
		},
	})
end

function hyprbars.toggle()
	if hl.get_config("plugin.hyprbars.enabled") == true then
		hyprbars.set({ enabled = false })
	else
		hyprbars.set({ enabled = true })
	end
end

hl.bind("SUPER + CTRL + H", hyprbars.toggle)

plugins.hyprbars = hyprbars
