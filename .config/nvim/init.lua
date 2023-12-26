
require('option')

local dpp_src = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp.vim"
vim.opt.runtimepath:prepend(dpp_src)

local dpp = require("dpp")
local dpp_config = "~/.config/nvim/dpp.ts"
local denops_src = "$HOME/.cache/dpp/repos/github.com/vim-denops/denops.vim"

local dppBase = "~/.cache/dpp"
if dpp.load_state(dppBase) then
  vim.opt.runtimepath:prepend(denops_src)

  vim.api.nvim_create_autocmd("User", {
    pattern = "DenopsReady",
    callback = function()
      vim.notify("dpp load_state() is failed")
      dpp.make_state(dppBase, dpp_config)
    end,
  })
end

vim.api.nvim_create_autocmd("User", {
  pattern = "Dpp:makeStatePost",
  callback = function()
    vim.notify("dpp make_state() is done")
  end,
})
