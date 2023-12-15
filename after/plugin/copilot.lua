require("copilot").setup({
	suggestion = {
		auto_trigger = true,
		keymap = {
			accept = "<M-a>",
			accept_word = "M-w",
			accept_line = "<M-l>",
		},
	},
	panel = {
		enabled = true,
		auto_refresh = false,
	},
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
})
vim.cmd("Copilot disable")
vim.g.copilot_enabled = false

vim.api.nvim_set_keymap('n', '<leader>aco', ':lua if vim.g.copilot_enabled then vim.cmd("Copilot disable"); vim.g.copilot_enabled = false else vim.cmd("Copilot enable"); vim.g.copilot_enabled = true end<CR>', { noremap = true, silent = true, desc = "Toggle Copilot" })
