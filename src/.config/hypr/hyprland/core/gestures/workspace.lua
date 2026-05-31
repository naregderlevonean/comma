hl.gesture({ fingers = 4, direction = "up", action = helpers.scoped.workspace(helpers.workspace.next()) })
hl.gesture({ fingers = 4, direction = "down", action = helpers.scoped.workspace(helpers.workspace.prev()) })
hl.gesture({ fingers = 4, direction = "left", action = helpers.specialworkspace.stop() })
hl.gesture({ fingers = 4, direction = "right", action = helpers.specialworkspace.start() })
