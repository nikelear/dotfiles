require('nvim-treesitter.configs').setup{
        ensure_installed = {
          'c', 'cpp', 'rust', 'c_sharp',
          'haskell',
          'go', 'lua', 'python',
          'html', 'css', 'tsx', 'javascript', 'typescript',
          'vimdoc', 'vim', 'bash',
          'regex','markdown',
        },
        highlight = { enable = true },
        indent = { enable = true },

        textobjects = {
          select = {
            enable = true,
            keymaps = {
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@class.outer',
              ['ic'] = '@class.inner',
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']m'] = '@function.outer',
              [']]'] = '@class.outer',
            },
            goto_next_end = {
              [']M'] = '@function.outer',
              [']['] = '@class.outer',
            },
            goto_previous_start = {
              ['[m'] = '@function.outer',
              ['[['] = '@class.outer',
            },
            goto_previous_end = {
              ['[M'] = '@function.outer',
              ['[]'] = '@class.outer',
            },
          },
        },    

}
