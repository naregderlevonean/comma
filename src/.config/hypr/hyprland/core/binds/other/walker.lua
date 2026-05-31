hl.bind("XF86Search", components.walker.toggle())
hl.bind("SUPER_L", helpers.bind.double(components.walker.toggle()))

hl.bind("SUPER + Tab", components.walker.toggle({ provider = "windows" }))
hl.bind("SUPER + Grave", components.walker.toggle({ provider = "clipboard" }))

