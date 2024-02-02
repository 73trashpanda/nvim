if not require('catppuccin') then
	return
end

local catppuccin = require("catppuccin")

catppuccin.setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		fidget = true,
	}
})
