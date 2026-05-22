hl.bind("Menu", components.waybar.toggle())

hl.bind("XF86Search", hl.dsp.exec_cmd("walker"))
hl.bind("ALT_L", helpers.bind.double(hl.dsp.exec_cmd("walker")))

hl.bind("ALT + Tab",  hl.dsp.exec_cmd("walker --provider windows"))

