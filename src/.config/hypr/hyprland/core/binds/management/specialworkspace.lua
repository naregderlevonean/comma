local specialworkspace = actions.specialworkspace.toggle

hl.bind("SUPER + ALT + Escape", specialworkspace())
hl.bind("SUPER + ALT + Tab", specialworkspace("stylus"))
hl.bind("SUPER + ALT + Grave", specialworkspace("radio"))
hl.bind("SUPER + ALT + Backspace", specialworkspace("vpn"))
