if not pcall(require, "null-ls") then
	return
end

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	sources = {
		formatting.stylua,
		formatting.prettier,
		diagnostics.eslint,
		formatting.black,
		diagnostics.flake8,
		formatting.phpcsfixer,
		formatting.shellcheck,
	},
})
