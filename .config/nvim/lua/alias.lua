vim.api.nvim_create_user_command('Di','call dpp#async_ext_action("installer", "install")', {})
vim.api.nvim_create_user_command('Du','call dpp#async_ext_action("installer", "update")', {})