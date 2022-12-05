local comment = require "Comment"
local ft = require "Comment.ft"

-- Comment strings
ft.c = { "/*%s*/", "/*%s*/" }
ft.lua = { "--%s", "--[[%s--]]" }

comment.setup {
	padding = true, -- add a space after the comment string
	toggler = { line = toggle_cmt },
	opleader = {
		line = cmt_leader,
		block = block_cmt_leader
	},
	extra = {
		above = cmt_above,
		below = cmt_below,
		eol = cmt_end,
	},
	mappings = {
		-- Operator-pending mapping
		-- Includes `gcc`, `gbc`, `gc[count]{motion}` and `gb[count]{motion}`
		basic = true,
		-- Extra mapping
		-- Includes `gco`, `gcO`, `gcA`
		extra = true,
		-- Extended mapping
		-- Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
		extended = false
	}
}
