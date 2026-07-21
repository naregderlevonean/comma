local M = {}

function M.init()
	require("hyprland.visual.animations.presets.framer.border")
	require("hyprland.visual.animations.presets.framer.fade")
	require("hyprland.visual.animations.presets.framer.layers")
	require("hyprland.visual.animations.presets.framer.other")
	require("hyprland.visual.animations.presets.framer.specialworkspace")
	require("hyprland.visual.animations.presets.framer.windows")
	require("hyprland.visual.animations.presets.framer.workspace")
end

return M
