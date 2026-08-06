local globalInversionActive = false

hl.plugin.darkwindow.load_shader("reverse", {
	source = [[
      void windowShader(inout vec4 color) {
          float luma = dot(color.rgb, vec3(0.2126, 0.7152, 0.0722));
          float invertedLuma = 1.0 - luma;
          color.rgb = color.rgb * (invertedLuma / max(luma, 0.0001));
          color.rgb = clamp(color.rgb, 0.0, 1.0);
      }
    ]],

	fade_in_speed = 3,
	fade_out_speed = 3,

	introduces_transparency = false,
})

hl.bind("SUPER + CTRL + I", function()
	globalInversionActive = not globalInversionActive

	if globalInversionActive then
		hl.config({
			general = {
				col = {
					active_border = 0x9400000,
					inactive_border = 0x4900000,
				},
			},
			plugin = {
				hyprbars = {
					bar_color = 0xff272727,
					col = {
						text = 0xff000000,
					},
				},
			},
		})

		hl.window_rule({
			match = { class = ".*" },
			["darkwindow:shade"] = "reverse",
		})
	else
		hl.config({
			general = {
				col = {
					active_border = 0x94ebebeb,
					inactive_border = 0x49ebebeb,
				},
			},
			plugin = {
				hyprbars = {
					bar_color = 0xff272727,
					col = {
						text = 0xebebebff,
					},
				},
			},
		})

		hl.window_rule({
			match = { class = ".*" },
			["darkwindow:shade"] = "",
		})
	end
end)
