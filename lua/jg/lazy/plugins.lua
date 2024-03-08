local plugins = {
	{
		"catppuccin/nvim",
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

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",
		},
	},
	{ "mfussenegger/nvim-jdtls" },
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
	},
	{
		-- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
	},
	{ "onsails/lspkind.nvim" },
	{
		-- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{
		"nvim-treesitter/playground",
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
	-- { "arkav/lualine-lsp-progress", lazy = true },
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
		event = "InsertEnter",
		cmd = "Copilot",
	},
	{ "zbirenbaum/copilot-cmp" },
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
}

return plugins
