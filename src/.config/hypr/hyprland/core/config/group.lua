hl.config({
    group = {
        auto_group = true,
        drag_into_group = 1,
        focus_removed_window = true,
        group_on_movetoworkspace = false,
        insert_after_current = true,
        merge_floated_into_tiled_on_groupbar = false,
        merge_groups_on_drag = true,
        merge_groups_on_groupbar = true,
    }
})

require("hyprland.core.config.group.col")
require("hyprland.core.config.group.groupbar")

