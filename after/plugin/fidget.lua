if not pcall(require, 'fidget') then
  return
end

-- Turn on lsp status information
require('fidget').setup()
