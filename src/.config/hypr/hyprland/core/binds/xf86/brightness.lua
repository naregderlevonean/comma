hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%-"), { repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +1%"), { repeating = true })

hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })
hl.bind("ALT + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })

hl.bind("SHIFT + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 1%"))
hl.bind("SHIFT + XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 100%"))

