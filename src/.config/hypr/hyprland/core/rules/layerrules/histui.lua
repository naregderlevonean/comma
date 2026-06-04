hl.layer_rule({
	name = "histui",
	match = { namespace = "histui-notification" },
	above_lock = 2,
	blur = true,
	blur_popups = true,
	ignore_alpha = 0.64,
})
