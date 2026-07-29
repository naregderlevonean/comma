local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if not vim.uv.fs_stat(lazypath) then
	if vim.fn.executable("git") == 0 then
		vim.notify("Git is required to install lazy.nvim", vim.log.levels.ERROR)
		vim.cmd.quitall()
	end

	local repository = "https://github.com/folke/lazy.nvim.git"
	local output = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		repository,
		lazypath,
	})

	if vim.v.shell_error ~= 0 then
		vim.notify(output, vim.log.levels.ERROR)
		vim.cmd.quitall()
	end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{
			import = "plugins",
		},
	},
	ui = {
		border = "rounded",
		icons = {
			cmd = " ",
			config = " ",
			event = " ",
			ft = " ",
			init = " ",
			keys = " ",
			plugin = " ",
			runtime = " ",
			source = " ",
			start = " ",
			task = " ",
			lazy = " ",
		},
	},
	checker = {
		enabled = true,
		frequency = 86400,
		notify = false,
	},
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	install = {
		colorscheme = {
			"van",
			"default",
		},
	},
})

vim.cmd("colorscheme van")
