-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- <Space> do nothing in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

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

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- Copy current line and all lines below to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete selected text and place it in the default register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Format current buffer with language server
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>do", vim.diagnostic.open_float)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeToggle<CR>', {desc = 'Open NvimTree', noremap = true, silent = true})

