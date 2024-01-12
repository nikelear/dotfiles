return function ()
  require("Comment").setup()
  local opt = { noremap = true, silent = true }
  vim.keymap.set("n", "<C-/>", "gcc", {})
  vim.keymap.set("v", "<C-/>", "gc", {})
  vim.keymap.set('i', '<C-/>', [[jjj<Esc>:normal gcc<CR>:s/jjj//g<CR>A]], {})
end