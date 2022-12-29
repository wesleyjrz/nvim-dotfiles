local zen = require "zen-mode"

zen.setup {
	window = {
		width = 112,
		height = .98,
		options = {
			number = false,
			relativenumber = false,
			cursorline = true,
			list = false
		}
	},


	on_open = function()
		-- Set dimmed area to be transparent
		vim.api.nvim_set_hl(0, "ZenBg", { ctermbg = 0 })

		-- Enable inline diagnostics
		vim.diagnostic.config({ virtual_text = true })
	end,
	on_close = function()
		-- Disable inline diagnostics
		vim.diagnostic.config({ virtual_text = false })
	end

}
