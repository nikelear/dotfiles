vim.api.nvim_create_user_command("call dpp#async_ext_action('installer', 'install')", "dppins", {})
vim.api.nvim_create_user_command("call dpp#async_ext_action('installer', 'update')", "dppupd", {})