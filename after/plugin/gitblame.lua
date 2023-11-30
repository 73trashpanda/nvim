require('gitblame').setup {
	--Note how the `gitblame_` prefix is omitted in `setup`
	enabled = false,
}

vim.g.gitblame_date_format = '%r'
vim.g.lame_virtual_text_column = 80

vim.keymap.set("n", "<leader>gb", function()
	vim.cmd("GitBlameToggle")
end, { desc = "Toggle [G]it [B]lame", noremap = true, silent = true })
