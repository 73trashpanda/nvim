-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- <Space> do nothing in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { desc = "<Space> do nothing in normal and visual mode", silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- Copy/paste to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])

-- Copy current line and all lines below to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete selected text and place it in the default register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Format current buffer with language server
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)


-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up", noremap = true, silent = true })
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down", noremap = true, silent = true })
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left", noremap = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right", noremap = true, silent = true })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Decrease visual selection indent", noremap = true })
vim.keymap.set("v", ">", ">gv", { desc = "Increase visual selection indent", noremap = true })


-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Toggle NvimTree
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>',
	{ desc = 'Open NvimTree', noremap = true, silent = true })

-- Exit terminal mode with Esc
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal-mode', noremap = true, silent = true })

