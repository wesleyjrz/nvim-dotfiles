local nvim_terminal = require "nvim-terminal"

-- Hide terminal buffer
vim.o.hidden = true

nvim_terminal.setup {
	window = {
		position = "botright",
		split = "sp",
		height = 14
	}
}
