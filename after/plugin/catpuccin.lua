if not require('catppuccin') then
	return
end

local catppuccin = require("catppuccin")

catppuccin.setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		fidget = true,
		cmp = true,
	},
	styles = {             -- Handles the styles of general hi groups (see `:h highlight-args`):
		comments = { "italic" }, -- Change the style of comments
		conditionals = { "italic" },
		loops = {},
		functions = {},
		keywords = { "bold" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = { "bold" },
		-- miscs = {}, -- Uncomment to turn off hard-coded styles
	},
})
