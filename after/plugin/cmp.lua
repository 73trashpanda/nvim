if not pcall(require, "cmp") then
	return
end

if not pcall(require, "luasnip") then
	return
end

if not pcall(require, 'lspkind') then
	return
end


local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local kind_icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
	Copilot = "",
}

-- lspkind.lua
lspkind.init({
	symbol_map = {
		Copilot = "",
	},
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

luasnip.config.setup({})

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
	view = {
		entries = "custom",
		completion = {
			winhighlight = 'Normal:CmpPmenu,CursorLine:PmenuSel,Search:None,FloatBorder:None',
		},
	},
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
		["<C-e>"] = cmp.mapping.abort(),
		["<C-y>"] = cmp.mapping(
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
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				copilot = "[Copilot]",
			})[entry.source.name]
			return vim_item
		end
	},
})
