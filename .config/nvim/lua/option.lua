-- lua load faster
vim.loader.enable()

-- row number
vim.wo.number = true
vim.wo.relativenumber = true
-- keep space for signcolumn
vim.wo.signcolumn = 'yes'

-- highlight on search
vim.o.hlsearch = false
-- mouse mode
vim.o.mouse = 'a'
-- share clipboard
vim.o.clipboard = 'unnamedplus'
-- keep indent when break
vim.o.breakindent = true
-- save history
vim.o.undofile = true
-- lastcol
vim.o.virtualedit = 'onemore'
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
-- update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- completion settings
vim.o.completeopt = 'menuone,noselect'
-- completion count
vim.o.pumheight = 10

-- terminal 256 colors
vim.o.termguicolors = true

vim.opt.list = true
vim.opt.listchars = {
  tab = '>>',
  trail = '-',
  nbsp = '+',
  eol = '↵',
}



