return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		check_ts = true,
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			java = false,
		},
		disable_filetype = { "TelescopePrompt", "spectre_panel", "neo-tree", "lazy", "mason" },
		disable_in_macro = true,
		enable_check_bracket_line = false,
		map_cr = true,
		map_bs = true,
		ignored_next_char = "[%w%%%'%[%'%\"]",
		fast_wrap = {
			map = "<M-e>",
			chars = { "{", "[", "(", '"', "'" },
			pattern = [=[[%'%"%)%>%]%)%}%,]]=],
			offset = -1,
			end_key = "$",
			keys = "qwertyuiopzxcvbnmasdfghjkl",
			check_comma = true,
			highlight = "Search",
			highlight_grey = "Comment",
		},
	},
}
