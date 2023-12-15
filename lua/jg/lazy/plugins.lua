local plugins = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},

	{
		-- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- ful status updates for LSP
			{
				"j-hui/fidget.nvim",
				lazy = true,
				tag = "legacy",
			},

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	},
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				lazy = true,
			},
			{
				"nvim-treesitter/nvim-treesitter-context",
				lazy = true,
			},
			{
				"elgiano/nvim-treesitter-angular",
				branch = "topic/jsx-fix",
			},
		},
	},

	-- Git related plugins
	{
		'f-person/git-blame.nvim',
		lazy = true
	},
	{
		"tpope/vim-fugitive",
		lazy = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
	},
	{
		"nvim-lualine/lualine.nvim",
		lazy = true,
	},
	{ "arkav/lualine-lsp-progress", lazy = true },
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		lazy = true,
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
	},
	{
		"tpope/vim-sleuth",
		lazy = true,
	},

	-- Fuzzy Finder (files, lsp, etc)
	{
		"nvim-telescope/telescope.nvim",
		lazy = true,
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
			-- Fuzzy Finder Algorithm which dependencies local dependencies to be built. Only load if `make` is available
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				lazy = true,
				cond = vim.fn.executable("make") == 1,
			},
		},
	},

	-- AI related plugins
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
	},
	{
		"jackMort/ChatGPT.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
		},
	},
	{ "David-Kunz/gen.nvim" },

	-- Misc
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
	},
	{
		"mbbill/undotree",
		event = "VeryLazy",
	},
	{
		"folke/zen-mode.nvim",
		keys = { "<leader>z", mode = "n" },
	},
	{ "ThePrimeagen/harpoon" },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		--   "BufReadPre path/to/my-vault/**.md",
		--   "BufNewFile path/to/my-vault/**.md",
		-- },
		dependencies = {
			-- Required.
			"nvim-lua/plenary.nvim",

			-- see below for full list of optional dependencies 👇
		},
	}
}

return plugins
