local hyprexpo = {}

hl.config({
	plugin = {
		hyprexpo = {
			animate_entry = false,
			bg_col = "0xed080808",
			border_color = "0xed080808",
			border_color_current = "0xed080808",
			border_color_focus = "0xed080808",
			border_color_hover = "0xed080808",
			border_width = 0,
			cancel_key = "escape",
			columns = 4,
			drag_drop_proxy_active_color = "0xed080808",
			drag_drop_proxy_border_color = "0xed080808",
			drag_drop_proxy_border_width = 0,
			drag_drop_proxy_color = "0xed080808",
			drag_drop_proxy_rounding = 96,
			drag_drop_source_border_color = "0xed080808",
			drag_drop_source_border_width = 0,
			dynamic_grid = false,
			enable_drag_move = true,
			fill_gaps = true,
			gaps_in = 32,
			gaps_out = 96,
			gesture_direction = "vertical",
			gesture_distance = 200,
			gesture_fingers = 4,
			keynav_enable = true,
			keynav_reading_order = false,
			keynav_wrap_h = true,
			keynav_wrap_v = true,
			label_bg_color = "0xed080808",
			label_bg_enable = true,
			label_bg_rounding = 8,
			label_bg_shape = "circle",
			label_center_adjust_x = 0,
			label_center_adjust_y = 0,
			label_color = "0xebebebed",
			label_color_current = "0xebebebed",
			label_color_default = "0xebebebed",
			label_color_focus = "0xebebebed",
			label_color_hover = "0xebebebed",
			label_enable = true,
			label_font_bold = false,
			label_font_family = "Ubuntu Sans Mono",
			label_font_italic = false,
			label_font_size = 10,
			label_offset_x = 0,
			label_offset_y = 0,
			label_padding = 32,
			label_pixel_snap = true,
			label_position = "center",
			label_scale_focus = 1.0,
			label_scale_hover = 1.0,
			label_show = "hover+focus",
			label_text_mode = "id",
			label_text_strikethrough = false,
			label_text_underline = false,
			label_token_map = "",
			max_workspace = 0,
			mru_sort = false,
			number_key_mode = "workspace",
			selection_label_color = "0xebebebed",
			selection_label_enable = false,
			selection_label_offset_x = 6,
			selection_label_offset_y = 6,
			selection_label_position = "top-right",
			selection_label_token_map = "1,2,3,4,5,6,7,8,9",
			show_cursor = true,
			show_pinned_windows = false,
			show_workspace_numbers = false,
			skip_empty = false,
			tile_rounding = 96,
			tile_rounding_current = 96,
			tile_rounding_focus = 96,
			tile_rounding_hover = 96,
			tile_rounding_power = 10.0,
			wallpaper_bg = true,
			workspace_method = "first 1",
			workspace_number_color = "0xebebebed",
		},
	},
})

local function count()
	local workspaces = hl.get_workspaces()
	local max = 1

	if not workspaces then
		return 1
	end

	for _, workspace in ipairs(workspaces) do
		if workspace.id > 0 and workspace.id > max then
			max = workspace.id
		end
	end

	return max
end

local function grid(number)
	return math.max(2, math.ceil(math.sqrt(number)))
end

function hyprexpo.start()
	return function()
		local workspaces = count()
		local columns = grid(workspaces)

		hl.config({
			plugin = {
				hyprexpo = {
					columns = columns,
				},
			},
		})

		hl.dispatch(components.walker.stop())

		hl.plugin.hyprexpo.expo("toggle")
		hl.dispatch(hl.dsp.submap("hyprexpo"))
	end
end

function hyprexpo.stop()
	return function()
		hl.plugin.hyprexpo.kb_confirm()
		hl.plugin.hyprexpo.expo("cancel")
		hl.dispatch(hl.dsp.submap("reset"))
	end
end

hl.bind("SUPER + ALT + Space", actions.scoped.workspace(hyprexpo.start()))

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

	hl.bind("Return", hyprexpo.stop())

	hl.bind("Escape", hyprexpo.stop())

	hl.bind("SUPER + ALT + Space", hyprexpo.stop())

	hl.bind("catchall", hl.dsp.no_op())
end)

return hyprexpo
