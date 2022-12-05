--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

local ab = vim.abbrev.set
local luasnip = require "luasnip"
local snip = luasnip.snippet
--[[
local node = luasnip.snippet_node
local indent = luasnip.indent_snippet_node
--]]
local txt = luasnip.text_node
local ins = luasnip.insert_node
--[[
local ft = luasnip.function_node
local ch = luasnip.choice_node
local dym = luasnip.dynamic_node
local rst = luasnip.restore_node
local events = require "luasnip.util.events"
local ai = require "luasnip.nodes.absolute_indexer"
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l
local postfix = require("luasnip.extras.postfix").postfix
--]]

--[[
	LuaSnip snippets
--]]

luasnip.add_snippets("vimwiki", {
	-- Header for notes
	snip("noteheader", {
		txt("# Title: "), ins(1),
		txt({"", "### Date: "}), ins(2),
		txt({"", "### Author: "}), ins(3)
	}),

	-- Header for VimWiki diary files
	snip("diaryheader", {
		txt({"# <date>"}), ins(1),
		txt({"", "**Author:** "}), ins(2),
		txt({"", "**Tags:** "}), ins(2)
	}),
})

--[[
	Abbreviations
--]]

-- Name
ab("wj.", "Wesley Jr.")
ab("wsjr.", "Wesley V. Santos Jr.")

-- E-Mail
ab("contact@", "contact@wesleyjrz.com")
ab("contato@", "contato@wesleyjrz.com")
ab("dev@", "dev@wesleyjrz.com")
ab("gmail@", "wesleyjr2002@gmail.com")
ab("outlook@", "wesleyjr2002@outlook.com")

-- Writing
ab("-.", "—")
ab("eg", "e.g.")
ab("ie", "i.e.")
ab("tldr", "TL;DR")
