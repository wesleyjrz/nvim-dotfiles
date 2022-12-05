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
		-- Enable inline diagnostics
		vim.diagnostic.config({ virtual_text = true })
	end,
	on_close = function()
		-- Disable inline diagnostics
		vim.diagnostic.config({ virtual_text = false })
	end

}
