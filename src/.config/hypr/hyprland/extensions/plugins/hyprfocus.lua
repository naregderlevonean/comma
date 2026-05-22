hl.config({
    plugin = {
        hyprfocus = {
            mode = "slide",
            slide_height = 4,
        }
    }
})

hl.animation({ 
    leaf = "hyprfocusIn", 
    enabled = true, 
    speed = 2, 
    bezier = "linear" 
})

hl.animation({ 
    leaf = "hyprfocusOut", 
    enabled = true, 
    speed = 2, 
    bezier = "linear" 
})
