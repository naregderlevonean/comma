hl.bind("Menu", components.waybar.toggle())

hl.bind("XF86Search", hl.dsp.exec_cmd("walker"))
hl.bind("SUPER_L", helpers.bind.double(hl.dsp.exec_cmd("walker")))

hl.bind("SUPER + Tab",  hl.dsp.exec_cmd("walker --provider windows"))
hl.bind("SUPER + Grave",  hl.dsp.exec_cmd("walker --provider clipboard"))
