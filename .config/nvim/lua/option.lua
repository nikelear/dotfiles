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
-- vim.o.autoindent = true
-- vim.o.smartindent = true
vim.o.breakindent = true
-- save history
vim.o.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300
-- completion settings
vim.o.completeopt = 'menuone,noselect'
-- terminal 256 colors
vim.o.termguicolors = true


