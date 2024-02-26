return {
	{
		"catppuccin/nvim",
		lazy = false,  -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		opts = {
			flavour = "mocha",
			transparent_background = true,
			integrations = {
				fidget = true,
				cmp = true,
			}
		}
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
		lazy = true,
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,
	},

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
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
			filetypes = {
				yaml = false,
				terraform = false,
				markdown = false,
				gitcommit = false,
				help = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
				sh = function()
					if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
						-- disable for .env files
						return false
					end
					return true
				end,
			},
		},
		keys= {
			{ 'n', '<leader>aco',
				':lua if vim.g.copilot_enabled then vim.cmd("Copilot disable"); vim.g.copilot_enabled = false else vim.cmd("Copilot enable"); vim.g.copilot_enabled = true end<CR>',
				"Toggle Copilot" }
		},
		config = function()
			require("copilot").setup()
		end,
	},
	{ "zbirenbaum/copilot-cmp" },
	{ "David-Kunz/gen.nvim" },

	-- Misc
	{
		"norcalli/nvim-colorizer.lua",
		event = "VeryLazy",
		opts = {
			filetypes = {
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"css",
				"html",
				"astro",
				"lua",
			},
			user_default_options = {
				rgb_fn = true,
				tailwind = "both",
			},
			buftypes = {
				-- '*', -- seems like this doesn't work with the float window, but works with the other `buftype`s.
				-- Not sure if the window has a `buftype` at all
			},
		}
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
