require('lazy').setup({
  {
    -- pairs
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
    end
  },

  -- jud filetype speedup
  {'nathom/filetype.nvim',opts = {}},

  -- view keymap
  {'folke/which-key.nvim',opts = {}},

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  -- auto judge indent
  {'tpope/vim-sleuth',},


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

  -- view colorcode
  {"norcalli/nvim-colorizer.lua",opts = {}},
  
  -- git
  {"lewis6991/gitsigns.nvim",opts = {}},

  {
    -- makeup line
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opt = {}
  },

  -- toggle comment
  {'numToStr/Comment.nvim',opts = {}},

  -- bufferline
  {'akinsho/bufferline.nvim',opts = {}},

  -- line-view for lsp 
  {'https://git.sr.ht/~whynothugo/lsp_lines.nvim',opts = {}},

  -- view same words
  {'yamatsum/nvim-cursorline',opts = {}},

  -- jumper
  {'pechorin/any-jump.vim',},

}, {})

