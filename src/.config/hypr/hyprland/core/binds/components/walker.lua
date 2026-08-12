local scoped = actions.scoped.workspace
local double = system.press.double
local walker = components.walker

hl.bind("SUPER_L", double(scoped(walker.toggle(), { special = true })))
hl.bind("XF86Search", scoped(walker.toggle(), { special = true }))

hl.bind("SUPER + Space", scoped(walker.toggle({ provider = "windows" }), { special = true }))
hl.bind("SUPER + Grave", scoped(walker.toggle({ provider = "clipboard" }), { special = true }))
