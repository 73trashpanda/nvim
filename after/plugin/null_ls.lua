if not pcall(require, "null-ls") then
	return
end

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
	debug = true,
	sources = {
		formatting.stylua,
		formatting.prettier_eslint,
		-- formatting.prettier,
		diagnostics.eslint,
		code_actions.xo,
		formatting.black,
		diagnostics.flake8.with({
			arg = { "--max-line-length=88", "--extend-ignore=E203,501", "--select=C,E,F,W,B,B950" },
		}),
		formatting.phpcsfixer,
		diagnostics.shellcheck,
	},
})
