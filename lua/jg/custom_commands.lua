vim.api.nvim_create_user_command("FullPath", function()
	print(vim.fn.expand('%:p'))
end, {})
