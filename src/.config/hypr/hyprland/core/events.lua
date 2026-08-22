hl.on("workspace.active", components.waybar.refresh())
hl.on("monitor.layout_changed", components.waybar.refresh())

hl.on("workspace.active", components.walker.stop())
hl.on("workspace.special_active", components.walker.stop())
