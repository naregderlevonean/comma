hl.bind("XF86PowerOff", hl.dsp.exec_cmd("pidof hyprlock && systemctl suspend || hyprlock"), { locked = true })
