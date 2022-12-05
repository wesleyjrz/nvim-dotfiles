local treesitter = require "nvim-treesitter.configs"

-- List of Treesitter supported programming languages
local parsers = {
	"bash", "c", "cpp", "lua", "python", "julia", "javascript", "sql", "http",
	"html", "css", "scss", "latex", "bibtex", "json", "json5", "comment",
	"regex", "nix", "make", "cmake", "dockerfile", "toml", "markdown",
	"markdown_inline", "vim", "help", "gitattributes"
}

treesitter.setup {
	ensure_installed = parsers,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false
	},
	indent = { enable = true },

	-- External modules
	autotag = { enable = true },
	rainbow = {
		enable = false,
		extended_mode = true
	}
}
