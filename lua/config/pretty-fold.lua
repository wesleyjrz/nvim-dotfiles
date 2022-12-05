local pretty_fold = require "pretty-fold"

pretty_fold.setup {
	sections = {
		left = { "content" },
		right = {
			" ", "number_of_folded_lines", " ",
			function(config) return config.fill_char:rep(3) end
		}
	},
	fill_char = "•",
	remove_fold_markers = true,

	-- Keep the indentation of the content of the fold string
	keep_indentation = true,

	-- Possible values:
	-- delete: Delete all comment signs from the fold string
	-- spaces: Replace all comment signs with equal number of spaces
	-- false: Do nothing with comment signs
	process_comment_signs = "spaces",
}
