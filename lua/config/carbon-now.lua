local carbon = require "carbon-now"

carbon.setup {
	open_cmd = "$BROWSER",
	options = {
		theme = "nord",
		bg = "#88C0D0",
		font_family = "JetBrains Mono",
		font_size = "18px",
		line_numbers = true,
		drop_shadow = true,
		drop_shadow_offset_y = "6px",
		drop_shadow_blur = "12px"
	}
}
