local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file, {silent = true, noremap = true})
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {silent = true, noremap = true})

vim.keymap.set("n", "<leader>hh", function() ui.nav_file(1) end, {silent = true, noremap = true})
vim.keymap.set("n", "<leader>hj", function() ui.nav_file(2) end, {silent = true, noremap = true})
vim.keymap.set("n", "<leader>hk", function() ui.nav_file(3) end, {silent = true, noremap = true})
vim.keymap.set("n", "<leader>hl", function() ui.nav_file(4) end, {silent = true, noremap = true})
