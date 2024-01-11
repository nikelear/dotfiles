require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-d>'] = false,
        ['<C-u>'] = false,
      },
    },
  },
}

-- fzf setup(if installed)
pcall(require('telescope').load_extension, 'fzf')
require("telescope").load_extension("undo")