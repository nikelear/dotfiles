local plugins = {

  -- manager
  { "folke/lazy.nvim" },

  {
    "williamboman/mason.nvim",
    dependencies = {
      {"williamboman/mason-lspconfig.nvim"},
    },
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    config = function()
        require("plugin-config/lspconfig")
    end
  },

  -- CMP
  {
    "hrsh7th/nvim-cmp",
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
  
  -- skin
  {
    "folke/tokyonight.nvim",
    event = { "BufReadPre", "BufWinEnter" },
    config = function()
      require("plugin-config/tokyonight")
    end
  },
  -- makeup line
  {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  },
}

return plugins





-- require('lazy').setup({
--   
--   {
--     --skin
--     "folke/tokyonight.nvim",
--     event = { "BufReadPre", "BufWinEnter" },
--     config = function()
--       vim.cmd.colorscheme "tokyonight"
--     end
--   },


  
--   {
--     -- UI Library
--     "stevearc/dressing.nvim",
--     event = "VimEnter",
--     config = function()
--       require("dressing").setup()
--     end,
--   },

--   {
--     -- Highlight, edit, and navigate code
--     'nvim-treesitter/nvim-treesitter',
--     build = ':TSUpdate',
--     event = "VeryLazy",
--     config = function()
--       require('nvim-treesitter.configs').setup {
--         ensure_installed = {
--           'c', 'cpp', 'rust',
--           'go', 'lua', 'python',
--           'html', 'css', 'tsx', 'javascript', 'typescript',
--           'vimdoc', 'vim', 'bash'
--         },
--         auto_install = true,
--         highlight = { enable = true },
--         indent = { enable = true },
--         incremental_selection = {
--           enable = true,
--           keymaps = {
--             init_selection = '<c-space>',
--             node_incremental = '<c-space>',
--             scope_incremental = '<c-s>',
--             node_decremental = '<M-space>',
--           },
--         },
--         textobjects = {
--           select = {
--             enable = true,
--             lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--             keymaps = {
--               -- You can use the capture groups defined in textobjects.scm
--               ['aa'] = '@parameter.outer',
--               ['ia'] = '@parameter.inner',
--               ['af'] = '@function.outer',
--               ['if'] = '@function.inner',
--               ['ac'] = '@class.outer',
--               ['ic'] = '@class.inner',
--             },
--           },
--           move = {
--             enable = true,
--             set_jumps = true, -- whether to set jumps in the jumplist
--             goto_next_start = {
--               [']m'] = '@function.outer',
--               [']]'] = '@class.outer',
--             },
--             goto_next_end = {
--               [']M'] = '@function.outer',
--               [']['] = '@class.outer',
--             },
--             goto_previous_start = {
--               ['[m'] = '@function.outer',
--               ['[['] = '@class.outer',
--             },
--             goto_previous_end = {
--               ['[M'] = '@function.outer',
--               ['[]'] = '@class.outer',
--             },
--           },
--           swap = {
--             enable = true,
--             swap_next = {
--               ['<leader>a'] = '@parameter.inner',
--             },
--             swap_previous = {
--               ['<leader>A'] = '@parameter.inner',
--             },
--           },
--         },    
--       }
--     end
--   },

--   {
--     -- pair symbols
--     'windwp/nvim-autopairs',
--     event = 'InsertEnter',
--     config = function()
--       require('nvim-autopairs').setup()
--     end
--   },
--   {
--     -- pair words
--     'RRethy/nvim-treesitter-endwise',
--     event = 'InsertEnter',
--     config = function()
--       require('nvim-treesitter.configs').setup {
--         endwise = {
--             enable = true,
--         },
--       }
--     end,
--   },

--   {
--     -- view keymap
--     'folke/which-key.nvim',
--     event = "VeryLazy",
--     config = function()
--       require('which-key').register {
--         ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
--         ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
--         ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
--         ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
--         ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
--         ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
--         ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
--         ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
--       }
--       -- register which-key VISUAL mode
--       -- required for visual <leader>hs (hunk stage) to work
--       require('which-key').register({
--         ['<leader>'] = { name = 'VISUAL <leader>' },
--         ['<leader>h'] = { 'Git [H]unk' },
--       }, { mode = 'v' })
--     end,      
--   },


--   {
--     -- auto judge indent
--     'tpope/vim-sleuth',
--     event = {'BufNewFile', 'BufRead'},
--   },
  
--   {
--     "lukas-reineke/indent-blankline.nvim",
--     main = "ibl",
--     event = "VimEnter",
--     opts = {},
--   },

--   {
--     -- view colorcode
--     "norcalli/nvim-colorizer.lua",
--     event = {'BufNewFile', 'BufRead'},
--     opts = {}
--   },
  
--   {
--     -- git
--     "lewis6991/gitsigns.nvim",
--     event = "VeryLazy",
--     opts = {
--       signs = {
--         add = { text = '+' },
--         change = { text = '~' },
--         delete = { text = '_' },
--         topdelete = { text = '‾' },
--         changedelete = { text = '=' },
--       },

--       on_attach = function(bufnr)
--       local gs = package.loaded.gitsigns

--       local function map(mode, l, r, opts)
--         opts = opts or {}
--         opts.buffer = bufnr
--         vim.keymap.set(mode, l, r, opts)
--       end

--       -- Navigation
--       map({ 'n', 'v' }, ']c', function()
--         if vim.wo.diff then
--           return ']c'
--         end
--         vim.schedule(function()
--           gs.next_hunk()
--         end)
--         return '<Ignore>'
--       end, { expr = true, desc = 'Jump to next hunk' })

--       map({ 'n', 'v' }, '[c', function()
--         if vim.wo.diff then
--           return '[c'
--         end
--         vim.schedule(function()
--           gs.prev_hunk()
--         end)
--         return '<Ignore>'
--       end, { expr = true, desc = 'Jump to previous hunk' })

--       -- Actions
--       -- visual mode
--       map('v', '<leader>hs', function()
--         gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
--       end, { desc = 'stage git hunk' })
--       map('v', '<leader>hr', function()
--         gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
--       end, { desc = 'reset git hunk' })
--       -- normal mode
--       map('n', '<leader>hs', gs.stage_hunk, { desc = 'git stage hunk' })
--       map('n', '<leader>hr', gs.reset_hunk, { desc = 'git reset hunk' })
--       map('n', '<leader>hS', gs.stage_buffer, { desc = 'git Stage buffer' })
--       map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'undo stage hunk' })
--       map('n', '<leader>hR', gs.reset_buffer, { desc = 'git Reset buffer' })
--       map('n', '<leader>hp', gs.preview_hunk, { desc = 'preview git hunk' })
--       map('n', '<leader>hb', function()
--         gs.blame_line { full = false }
--       end, { desc = 'git blame line' })
--       map('n', '<leader>hd', gs.diffthis, { desc = 'git diff against index' })
--       map('n', '<leader>hD', function()
--         gs.diffthis '~'
--       end, { desc = 'git diff against last commit' })

--       -- Toggles
--       map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'toggle git blame line' })
--       map('n', '<leader>td', gs.toggle_deleted, { desc = 'toggle git show deleted' })

--       -- Text object
--       map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'select git hunk' })
--     end,

--     },
--   },

--   {
--     -- makeup line
--     'nvim-lualine/lualine.nvim',
--     event = "VeryLazy",
--     dependencies = { 'nvim-tree/nvim-web-devicons' },
--     opts = {}
--   },

--   -- toggle comment
--   {
--     'numToStr/Comment.nvim',
--     event = "VeryLazy",
--     opts = {}

-- -- comment.nvim
-- vim.keymap.set('n', '<C-/>', 'gcc', {})
-- vim.keymap.set('v', '<C-/>', 'gc', {})
-- vim.keymap.set('i', '<C-/>', [[jjj<Esc>:normal gcc<CR>:s/jjj//g<CR>A]],{ noremap = true, silent = true })
--   },

--   -- bufferline
--   {
--     'akinsho/bufferline.nvim',
--     event = "VeryLazy",
--     opts = {},
--   },

--   {
--     -- view same words
--     'kevinhwang91/nvim-hlslens',
--     event = {'BufNewFile', 'BufRead'},
--     opts = {}
--   },

--   -- jumper
--   {
--     'pechorin/any-jump.vim',
--     event = "VeryLazy",
--   },

--   {
--     -- ()
--     'kylechui/nvim-surround',
--     event = "VeryLazy",
--   },

  
--   {
--     -- part-edit
--     'thinca/vim-partedit',
--     event = {'BufNewFile', 'BufRead'},
--   },

--   {
--     'nvim-telescope/telescope.nvim',
--     branch = '0.1.x',
--     cmd = 'Telescope',
--     dependencies = {
--       'nvim-lua/plenary.nvim',
--       -- Fuzzy Finder Algorithm which requires local dependencies to be built.
--       -- Only load if `make` is available. Make sure you have the system
--       -- requirements installed.
--       {
--         'nvim-telescope/telescope-fzf-native.nvim',
--         -- NOTE: If you are having trouble with this installation,
--         --       refer to the README for telescope-fzf-native for more instructions.
--         build = 'make',
--         cond = function()
--           return vim.fn.executable 'make' == 1
--         end,
--       },
--     },

--     config = function()
--       require('telescope').setup {
--         defaults = {
--           mappings = {
--             i = {
--               ['<C-d>'] = false,
--               ['<C-u>'] = false,
--             },
--           },
--         },
--       }
      
--       -- fzf setup(if installed)
--       pcall(require('telescope').load_extension, 'fzf')

--       -- -- See `:help telescope.builtin`
--       vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
--       vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
--       vim.keymap.set('n', '<leader>/', function()
--         -- You can pass additional configuration to telescope to change theme, layout, etc.
--         require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--           winblend = 10,
--           previewer = false,
--         })
--       end, { desc = '[/] Fuzzily search in current buffer' })

--       local function telescope_live_grep_open_files()
--         require('telescope.builtin').live_grep {
--           grep_open_files = true,
--           prompt_title = 'Live Grep in Open Files',
--         }
--       end
--       vim.keymap.set('n', '<leader>s/', telescope_live_grep_open_files, { desc = '[S]earch [/] in Open Files' })
--       vim.keymap.set('n', '<leader>ss', require('telescope.builtin').builtin, { desc = '[S]earch [S]elect Telescope' })
--       vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
--       vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
--       vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
--       vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
--       vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
--       vim.keymap.set('n', '<leader>sG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
--       vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
--       vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

--     end
--   },
  


--   {
--     -- github copilot
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "VeryLazy",
--     config = function()
--       require("copilot").setup({})
--     end,
--   },


--   {
--     "j-hui/fidget.nvim",
--     event = 'LspAttach',
--     opts = {},
--   },

--   {
--     -- completion
--     'hrsh7th/nvim-cmp',
--     config = function()
      
--     end
--   },
-- }, {})
