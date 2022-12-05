local telescope = require "telescope"
local actions = require "telescope.actions"
local layout = require "telescope.actions.layout"

telescope.setup {
	defaults = {
		prompt_prefix = "  ",
		selection_caret = " ",
		mappings = {
			i = {
				["<C-u>"] = false, -- disable default mapping, currently using it to clear the prompt
				[telescope_close] = actions.close,
				[telescope_scroll_down] = actions.results_scrolling_down,
				[telescope_scroll_up] = actions.results_scrolling_up,
				[telescope_toggle_preview] = layout.toggle_preview
			},
			n = {
				[telescope_close] = actions.close,
				[telescope_file_edit] = actions.file_edit,
				[telescope_file_split] = actions.file_split,
				[telescope_file_vsplit] = actions.file_vsplit,
				[telescope_preview_scroll_down] = actions.preview_scrolling_down,
				[telescope_preview_scroll_up] = actions.preview_scrolling_up,
				[telescope_toggle_selection] = actions.toggle_selection,
				[telescope_toggle_all] = actions.toggle_all,
				[telescope_toggle_preview] = layout.toggle_preview
			}
		}
	},
	pickers = {
		find_files = { theme = "ivy" },
		live_grep = { theme = "ivy" },
		commands = { theme = "ivy" },
		help_tags = { theme = "ivy" }
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = true,
			override_file_sorter = true,
		},
		project = {
			base_dirs = {
				"~/Development/personal",
				"~/Development/fork",
				"~/Development/bluehawk",
				-- "~/Development/forever",
				"~/Development/studying"
			},
			theme = "ivy",
			sync_with_nvim_tree = true
		}
	}
}

local load_extensions = {
	"fzy_native",
	"project"
}

for _, ext in ipairs(load_extensions) do
	telescope.load_extension(ext)
end
