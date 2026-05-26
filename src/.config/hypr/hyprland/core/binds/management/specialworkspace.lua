hl.bind("SUPER + ALT + Grave", hl.dsp.workspace.toggle_special("radio"))
hl.bind("SUPER + ALT + Tab", hl.dsp.workspace.toggle_special("stylus"))

hl.bind("SUPER + ALT + Space", function()
    hl.dispatch(hl.dsp.workspace.toggle_special(""))
    hl.exec_cmd("walker --close")
end)
