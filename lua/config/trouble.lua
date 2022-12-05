local trouble = require "trouble"

trouble.setup {
	position = "bottom",
	height = 14,
	action_keys = {
		-- map to {} to remove a mapping, for example:
		-- close = {},
		close = trouble_close,
		cancel = trouble_cancel,
		refresh = trouble_refresh,
		jump = trouble_jump,
		open_split = telescope_file_split,
		open_vsplit = telescope_file_vsplit,
		open_tab = telescope_file_edit,
		jump_close = trouble_jump_and_close,
		toggle_mode = trouble_toggle_mode,
		hover = trouble_hover,
		toggle_fold = "za",
		previous = "k",
		next = "j"
	},
	auto_close = true,
	use_diagnostic_signs = true
}
