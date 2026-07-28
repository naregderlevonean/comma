vim.g.mapleader = " "
vim.g.maplocalleader = "\""

pcall(vim.cmd.colorscheme, "van")

vim.cmd([[
  highlight Normal guibg=none ctermbg=none
  highlight NonText guibg=none ctermbg=none
  highlight LineNr guibg=none ctermbg=none
  highlight SignColumn guibg=none ctermbg=none
  highlight EndOfBuffer guibg=none ctermbg=none
]])
