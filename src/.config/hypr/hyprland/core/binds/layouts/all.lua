local scoped = actions.scoped.workspace

hl.bind("SUPER + CTRL + ALT + Tab", scoped(actions.workspace.layout(), { special = true }))
