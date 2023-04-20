if not pcall(require, 'null-ls') then
  return
end

local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    sources = {
        formatting.stylua,
        formatting.prettier,
        formatting.black,
        formatting.phpcsfixer,
    },
})
