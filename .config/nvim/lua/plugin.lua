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
      require("gitsigns").setup()
    end
  },

  {
    -- makeup line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require("lualine").setup()
    end
  },

  {
    -- toggle comment
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },

}, {})

