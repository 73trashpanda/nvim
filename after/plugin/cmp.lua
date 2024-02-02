if not pcall(require, "cmp") then
	return
end

if not pcall(require, "luasnip") then
	return
end


local cmp = require("cmp")
local luasnip = require("luasnip")

luasnip.config.setup({})

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
		["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-y>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<c-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Insert,
				select = true,
			},
			{ "i", "c" }
		),
		["<M-y>"] = cmp.mapping(
			cmp.mapping.confirm {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			{ "i", "c" }
		),

		["<c-space>"] = cmp.mapping {
			i = cmp.mapping.complete(),
			c = function(
				_ --[[fallback]]
			)
				if cmp.visible() then
					if not cmp.confirm { select = true } then
						return
					end
				else
					cmp.complete()
				end
			end,
		},

		-- ["<tab>"] = false,
		["<tab>"] = cmp.config.disable,

	}),
	sources = {
		{ name = "nvim_lua", priority = 1 },
		{ name = "nvim_lsp", priority = 2 },
		{ name = "luasnip",  priority = 3 },
		{ name = "copilot",  priority = 4, max_item_count = 1, },
	},
	{
		{ name = "path" },
		{ name = "buffer", keyword_length = 5 },
	}
})
