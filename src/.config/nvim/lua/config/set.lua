vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.number = true
vim.opt.cursorline = true

vim.opt.clipboard = 'unnamed,unnamedplus'

vim.cmd.colorscheme('van')

vim.cmd [[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]]

vim.keymap.set({'n', 'i', 'v'}, '<C-s>', '<Esc>:w<cr>', { desc = 'Save file' })
