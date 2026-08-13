local focus = actions.window.focus

hl.gesture({ fingers = 3, direction = "left", action = focus("r") })
hl.gesture({ fingers = 3, direction = "right", action = focus("l") })
