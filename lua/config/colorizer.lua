local colorizer = require "colorizer"

colorizer.setup({ "*" }, {
	rgb_fn = true, -- Enable in RGB functions
	hsl_fn = true, -- Enable in HSL functions
	names = false, -- Enable in "Name" codes like = Red, Green, Blue
	mode = "background"
})
