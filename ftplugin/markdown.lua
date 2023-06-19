-- Enable word wrap for Markdown files
vim.opt_local.wrap = true

-- Enable auto-indentation
vim.opt_local.autoindent = true

-- Calculate margin based on the distance to the edge of the window
local margin = math.floor(vim.o.columns * 0.8) -- Adjust the percentage as desired

-- Set characters where line breaks are allowed for word wrap
vim.opt_local.breakat = [[\ \	;:,!?]]

-- Set the margin as the text width for word wrap
vim.opt_local.textwidth = margin
