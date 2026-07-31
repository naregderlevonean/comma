hl.config({
	plugin = {
		hyprexpo = {
			animate_entry = 0,
			bg_col = "0x08131313",
			border_color = "0x94ededed",
			border_color_current = "0x94ededed",
			border_color_focus = "0x94ededed",
			border_color_hover = "0x49ededed",
			border_width = 2,
			cancel_key = "escape",
			columns = 3,
			drag_drop_enable = 1,
			drag_drop_proxy_active_color = "0x94080808",
			drag_drop_proxy_border_color = "0x00000000",
			drag_drop_proxy_border_width = 0,
			drag_drop_proxy_color = "0x00000000",
			drag_drop_proxy_rounding = 96,
			drag_drop_source_border_color = "0x00000000",
			drag_drop_source_border_width = 0,
			dynamic_grid = 0,
			enable_drag_move = 1,
			fill_gaps = 1,
			gaps_in = 16,
			gaps_out = 96,
			gesture_distance = 200,
			keynav_enable = 1,
			label_bg_color = "0xed080808",
			label_bg_enable = 1,
			label_bg_shape = "circle",
			label_color = "0xedededed",
			label_color_default = "0xedededed",
			label_enable = 1,
			label_font_family = "Ubuntu Sans Mono",
			label_font_size = 10,
			label_position = "center",
			label_show = "always",
			label_text_mode = "id",
			label_token_map = "",
			mru_sort = 0,
			selecton_label_color = "0xedededed",
			selecton_label_enable = 0,
			selecton_label_position = "top-right",
			selecton_label_token_map = "1,2,3,4,5,6,7,8,9",
			show_cursor = 1,
			tile_rounding = 96,
			tile_rounding_current = 96,
			tile_rounding_focus = 96,
			tile_rounding_hover = 96,
			tile_rounding_power = 10.0,
			wallpaper_bg = "blur",
			workspace_method = "first 1",
		},
	},
})

local function start()
	hl.plugin.hyprexpo.expo("toggle")
	hl.dispatch(hl.dsp.submap("hyprexpo"))
end

hl.bind("SUPER + ALT + Escape", actions.scoped.workspace(start))

hl.define_submap("hyprexpo", function()
	hl.bind("Left", function()
		hl.plugin.hyprexpo.kb_focus("left")
	end)

	hl.bind("Right", function()
		hl.plugin.hyprexpo.kb_focus("right")
	end)

	hl.bind("Up", function()
		hl.plugin.hyprexpo.kb_focus("up")
	end)

	hl.bind("Down", function()
		hl.plugin.hyprexpo.kb_focus("down")
	end)

	hl.bind("Return", function()
		hl.plugin.hyprexpo.kb_confirm()
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	hl.bind("Escape", function()
		hl.plugin.hyprexpo.expo("cancel")
		hl.dispatch(hl.dsp.submap("reset"))
	end)

	hl.bind("catchall", hl.dsp.no_op())
end)
