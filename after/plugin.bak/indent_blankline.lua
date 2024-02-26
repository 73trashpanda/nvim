if not pcall(require, "ibl") then
  return
end

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require("ibl").setup {
  -- char = '┊',
  -- show_trailing_blankline_indent = false,
}
