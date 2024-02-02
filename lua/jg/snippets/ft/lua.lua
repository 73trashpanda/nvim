local ls = require "luasnip"
local snippet_collection = require "luasnip.session.snippet_collection"

local s = ls.s
local sn = ls.snippet_node

local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta


snippet_collection.clear_snippets("lua")
ls.add_snippets("lua", {
	s("pcall", fmta(
		[[
	  if not pcall(require, '<>') then
		  return
	  end
	]], { i(1, "module") }
	))
})
