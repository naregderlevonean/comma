local M = {}

function M.init()
	require("hyprland.visual.animations.presets.elastic.border")
	require("hyprland.visual.animations.presets.elastic.fade")
	require("hyprland.visual.animations.presets.elastic.layers")
	require("hyprland.visual.animations.presets.elastic.other")
	require("hyprland.visual.animations.presets.elastic.specialworkspace")
	require("hyprland.visual.animations.presets.elastic.windows")
	require("hyprland.visual.animations.presets.elastic.workspace")
end

return M
