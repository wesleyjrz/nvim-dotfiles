local sniprun = require "sniprun"

sniprun.setup {
	display = { "Terminal" },
	show_no_output = { "Classic" },
	snipruncolors = {
		SniprunVirtualTextOk = {
			bg = "#81A1C1",
			fg = "#2E3440"
		},
		SniprunVirtualTextErr = {
			bg="#BF616A",
			fg="#D8DEE9"
		}
	}
}
