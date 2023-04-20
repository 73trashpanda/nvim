local plugins = {
  -- the colorscheme should be available when starting Neovim
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    "lunarvim/darkplus.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },
  {
    'rose-pine/neovim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    name = 'rose-pine'
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
  },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- ful status updates for LSP
      {
        'j-hui/fidget.nvim',
        lazy = true,
      },

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    lazy = true,
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  },
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        lazy = true,
      },
      {
        'nvim-treesitter/nvim-treesitter-context',
        lazy = true,
      },
      {
        "elgiano/nvim-treesitter-angular",
        branch = "topic/jsx-fix",
      },

    }
  },

  -- Git related plugins
  {
    'tpope/vim-fugitive',
    lazy = true,
  },
  {
    'tpope/vim-rhubarb',
    lazy = true,
  },
  {
    'lewis6991/gitsigns.nvim',
    lazy = true,
  },

  {
    'nvim-lualine/lualine.nvim',
    lazy = true,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    lazy = true,
  },
  {
    'numToStr/Comment.nvim',
    event = "VeryLazy",
  },
  {
    'tpope/vim-sleuth',
    lazy = true,
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    lazy = true,
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim' }
  },

  -- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    lazy = true,
    cond = vim.fn
        .executable 'make' == 1
  },

  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  -- AI related plugins
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = {
      "zbirenbaum/copilot.lua",
      event = "VeryLazy",
    },
    lazy = true,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    'norcalli/nvim-colorizer.lua',
    event = "VeryLazy",
  },
  {
    'mbbill/undotree',
    event = "VeryLazy",
  },
  {
    "folke/zen-mode.nvim",
    keys = { "<leader>z", mode = "n" },
  },

  -- Tmux
  {
    'christoomey/vim-tmux-navigator',
  },
  {
    'christoomey/vim-tmux-runner',
  },
}

return plugins
