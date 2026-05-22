local function special()
    hl.dispatch(hl.dsp.workspace.toggle_special(""))
    hl.exec_cmd("walker --close")
end

hl.bind("SUPER + Grave", hl.dsp.workspace.toggle_special("radio"))
hl.bind("SUPER + Tab", hl.dsp.workspace.toggle_special("stylus"))

hl.bind("SUPER_L", helpers.bind.double(special))

