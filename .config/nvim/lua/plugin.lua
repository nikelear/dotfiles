return {

  { 
    -- manager
    "folke/lazy.nvim",
  },
  {
    -- skin
    "folke/tokyonight.nvim",
    -- "EdenEast/nightfox.nvim",
    event = {"ModeChanged", "BufRead", "BufNewFile"},
    config = function()
      require("plugin-config/tokyonight")
      -- vim.cmd[[colorscheme carbonfox]]
    end
  },
  -- {
  --   'goolord/alpha-nvim',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   config = function()
  --     require("alpha").setup(require"plugin-config/alpha".config)
  --   end
  -- },
  {
    -- notification etc
    'folke/noice.nvim',
    event = {"ModeChanged", "BufRead", "BufNewFile"},
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      }
  },
  {
    -- makeup line
    'nvim-lualine/lualine.nvim',
    event = {"ModeChanged", "BufRead", "BufNewFile"},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  },
  {
    -- buffer line
    'akinsho/bufferline.nvim',
    event = {"BufRead", "BufNewFile"},
    opts = {},
  },
  {
    -- completion symbols
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup()
    end
  },
  {
    -- completion endwise
    'RRethy/nvim-treesitter-endwise',
    event = 'InsertEnter',
    config = function()
      require('nvim-treesitter.configs').setup {
        endwise = {
            enable = true,
        },
      }
    end,
  },
  {
    -- toggle symbols
    'kylechui/nvim-surround',
    event = {'BufNewFile', 'BufRead'},
  },
  {
    -- toggle comment
    'numToStr/Comment.nvim',
    keys = {"<C-/>","g"},
    config = function()
      vim.keymap.set('n', '<C-/>', 'gcc', {})
      vim.keymap.set('v', '<C-/>', 'gc', {})
      vim.keymap.set('i', '<C-/>', [[jjj<Esc>:normal gcc<CR>:s/jjj//g<CR>A]],{ noremap = true, silent = true })
    end
  },
  {
    -- same words highlight
    'kevinhwang91/nvim-hlslens',
    event = {'BufNewFile', 'BufRead'},
    opts = {}
  },
  {
    -- jumper
    'pechorin/any-jump.vim',
    event = {'BufNewFile', 'BufRead'},
  },
  {
    -- part-edit
    'thinca/vim-partedit',
    event = {'BufNewFile', 'BufRead'},
  },
  {
    -- auto judge indent
    'tpope/vim-sleuth',
    event = {'BufNewFile', 'BufRead'},
  },
  {
    -- indent viewer
    "shellRaining/hlchunk.nvim",
    event = {'BufNewFile', 'BufRead'},
    config = function()
      require("hlchunk").setup({
        blank = {enable = false},
      })
    end,
  },
  {
    -- colorcode viewer
    "norcalli/nvim-colorizer.lua",
    event = {'BufNewFile', 'BufRead'},
    opts = {}
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    event = {'BufNewFile', 'BufRead'},
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
      'nvim-treesitter/nvim-treesitter-refactor',
    },
    config = function()
      require('plugin-config/treesitter')
    end
  },
  {
    -- git
    "lewis6991/gitsigns.nvim",
    event = {'BufNewFile', 'BufRead'},
    config = function()
      require('plugin-config/gitsigns')
    end,
    
  },
  {
    -- view keymap
    'folke/which-key.nvim',
    keys = require("plugin-config/any-key"),
    config = "plugin-config.which-key",
  },

  {
    -- fuzzy finder
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    -- cmd = 'Telescope',
    keys = require("plugin-config/telescope-keymap"),
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },

    config = function()
      require("plugin-config/telescope")
    end,
  },
  -- LSP -------------------------------------------------
  {
    -- LSP Config
    "neovim/nvim-lspconfig",
    event = {"ModeChanged"},
    dependencies = {
      {
        -- LSP,DAP manager
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
    },
    config = function()
        require("plugin-config/lspconfig")
        require("mason").setup({})
    end
  },
  {
    -- LSP status 
    "j-hui/fidget.nvim",
    event = 'LspAttach',
    opts = {},
  },
  {
    -- CMP
    "hrsh7th/nvim-cmp",
    event = {"CmdlineEnter","InsertEnter"},
    dependencies = {
      {"hrsh7th/cmp-nvim-lsp"},
      {"hrsh7th/cmp-buffer"},
      {"hrsh7th/cmp-path"},
      {"hrsh7th/cmp-cmdline"},
    },
    config = function()
      require("plugin-config/cmp")
    end
  },

}
