if not pcall(require, "luasnip") then
	return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config({
	enable_autosnippets = true,

	-- This one is cool cause if you have dynamic snippets, it updates as you type!
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { " « ", "NonTest" } },
			},
		},
	},
})

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/jg/snippets/ft/*.lua", true)) do
	loadfile(ft_path)()
end

-- Set keymap for <c-k> in insert and select modes.
-- This keymap checks if a snippet can be expanded or if the cursor can jump forward within the snippet.
-- If so, it either expands the snippet or jumps to the next placeholder.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true, desc = "Expand snippet or jump forward" })

-- Set keymap for <c-j> in insert and select modes.
-- This keymap is used for jumping backwards within a snippet.
-- It checks if jumping backwards is possible and, if so, performs the jump.
vim.keymap.set({ "i", "s" }, "<c-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true, desc = "Jump backwards within snippet" })

-- Set keymap for <c-l> in insert mode.
-- This keymap is used for cycling through choices in a choice node of a snippet.
-- If a choice node is active, it changes to the next available choice.
vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, { desc = "Cycle through choices in snippet" })

vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
