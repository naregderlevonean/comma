local workspace = actions.workspace.focus
local scoped = actions.scoped.workspace
local specialworkspace = actions.specialworkspace

hl.gesture({ fingers = 4, direction = "up", action = scoped(workspace("next"), { special = true }) })
hl.gesture({ fingers = 4, direction = "down", action = scoped(workspace("prev"), { special = true }) })
hl.gesture({ fingers = 4, direction = "right", action = specialworkspace.start(), { special = true } })
hl.gesture({ fingers = 4, direction = "left", action = specialworkspace.stop(), { special = true } })
