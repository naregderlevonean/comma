return {
	"windwp/nvim-autopairs",

	event = "InsertEnter",

	opts = {
		check_ts = true,

		disable_filetype = {
			"TelescopePrompt",
			"spectre_panel",
		},

		fast_wrap = {},

		enable_check_bracket_line = false,
	},

	config = function(_, opts)
		require("nvim-autopairs").setup(opts)
	end,
}
