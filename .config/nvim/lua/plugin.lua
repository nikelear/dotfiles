-- boot strap lazy.nvim
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {
    -- pairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
    require('nvim-autopairs').setup()
    end
  },

  {
    -- jud filetype speedup
    'nathom/filetype.nvim'
  },

  {
    -- view keymap
    'folke/which-key.nvim',
    opts = {}
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },


  {
    -- auto judge indent
    'tpope/vim-sleuth',
  },

  {
    -- view indent
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
       chunk = {
          chars = {
            horizontal_line = "─",
            vertical_line = "│",
            left_top = "╭",
            left_bottom = "╰",
            right_arrow = "→",
          },
          style = "#806d9c",
      },     
        })
    end
  },

  {
    -- view colorcode
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end
  },
  
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup(
        
      )
    end
  }
}, {})

