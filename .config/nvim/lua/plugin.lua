local dpp_src = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp.vim"
vim.opt.runtimepath:prepend(dpp_src) 

-- プラグイン内のLuaモジュールを読み込むため、先にruntimepathに追加する必要があります。
local dpp = require("dpp")

local ext_toml = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml"
local ext_lazy = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-lazy"
local ext_installer = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer"
local ext_git = "$HOME/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git"
vim.opt.runtimepath:append(ext_toml)
vim.opt.runtimepath:append(ext_git)
vim.opt.runtimepath:append(ext_lazy)
vim.opt.runtimepath:append(ext_installer)

local dpp_base = "$HOME/.cache/dpp/"
if dpp.load_state(dpp_base) then
	local denops_src = "$HOME/.cache/dpp/repos/github.com/vim-denops/denops.vim"
  	vim.opt.runtimepath:prepend(denops_src)

  	vim.api.nvim_create_autocmd("User", {
	  	pattern = "DenopsReady",
  	callback = function ()
		vim.notify("vim load_state is failed")

		local dpp_config = "$HOME/.config/nvim/dpp.ts"
  		dpp.make_state(dpp_base, dpp_config)
  	end
  })
end