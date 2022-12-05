local cmp = require "cmp"
local lspkind = require "lspkind"

lspkind.init()

cmp.setup {
	mapping = {
		[cmp_toggle] = function()
			if cmp.visible() then
				cmp.close()
			else
				cmp.complete()
			end
		end,
		[cmp_next] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end,
		[cmp_previous] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end,
		[cmp_scroll_down] = cmp.mapping.scroll_docs(3),
		[cmp_scroll_up] = cmp.mapping.scroll_docs(-3),
		[cmp_confirm] = function(fallback)
			if cmp.visible() then
				cmp.confirm {
					behavior = cmp.ConfirmBehavior.Insert,
					select = true
				}
			else
				fallback()
			end
		end
	},

	sources = {
		{ name = "path", keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
		{ name = "nvim_lsp", keyword_length = 2 },
		{ name = "nvim_lua", keyword_length = 2 },
		{ name = "buffer", keyword_length = 4 }
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end
	},

	formatting = {
		format = lspkind.cmp_format {
			with_text = true,
			menu = {
				path = "[path]",
				luasnip = "[snip]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[api]",
				buffer = "[buf]"
			}
		}
	},

	experimental = {
		ghost_text = false
	}
}
