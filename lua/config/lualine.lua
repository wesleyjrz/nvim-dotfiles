local lualine = require "lualine"

lualine.setup {
	options = {
		icons_enabled = true,
		theme = "nord",
		component_separators = { left = "|", right = "|" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
		globalstatus = true
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"diff",
				symbols = {
					added = " ",
					modified = " ",
					removed = " "
				},
			},
			"diagnostics"
		},
		lualine_c = {
			{
				"filename",
				symbols = {
					modified = " ",
					readonly = " ",
					unnamed = " [No Name]",
					newfile = " [New]"
				},
			},
			"lsp_progress"
		},
		lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = {},
		lualine_z = {}
	}
}
