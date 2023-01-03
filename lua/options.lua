--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

local o = vim.opt
local bo = vim.bo
local wo = vim.wo
local g = vim.g

--[[
	Appearance
--]]

o.termguicolors = true -- enables 24-bit RGB color
o.cursorline = false   -- highlight current line
o.cmdheight = 1        -- command line height
o.pumheight = 10       -- max number of items to show in the popup menu
o.showtabline = 0      -- show tabline
o.showmode = false     -- show current mode

-- Line numbers
wo.number = true         -- show line numbers
wo.numberwidth = 2       -- number of columns to use for line number
wo.relativenumber = true -- show relative line numbers
wo.signcolumn = "yes:1"  -- let signs have a 1 character width column

-- Whitespaces
o.list = true -- enable whitespaces
o.listchars = "eol:﬋,trail:·,multispace:·,nbsp:◇,tab: ,extends:▸,precedes:◂"

-- Visual wrapping
o.wrap = true      -- wrap lines
o.linebreak = true -- don't break incomplete words

-- Folding
o.foldexpr = "nvim_treesitter#foldexpr()" -- use Tree-sitter to handle foldings
--[[
NOTE: Currently using pretty-fold.nvim to handle this.

o.foldText = "getline(v:foldstart).' '"  -- folding text
o.fillchars = "fold: "                    -- set folding fill chars to blanks
--]]

--[[
	Behaviour
--]]

-- Language and encoding
o.fileencoding = "utf-8" -- default file encoding
o.spelllang = "en,pt"    -- spell checker languages

-- Misc
o.clipboard:append("unnamedplus") -- allow nvim to access system clipboard (depends on xclip)
o.autochdir = true                -- always change the current directory to the file parent directory
o.history = 1000                  -- save command history
o.mouse = "nv"                    -- enable mouse support on selected modes
o.exrc = true                     -- local config files support

-- Hide warnings
o.hidden = true         -- do not ask to save when switching buffers
o.shortmess:append("A") -- do not show attention messages when a swap file is found for the current file

-- Ignore case
o.ignorecase = true     -- ignore case in search patterns
o.wildignorecase = true -- ignore case when completing file names and directories

-- Scrolling
o.scrolloff = 8     -- lines to keep above and below the cursor
o.sidescrolloff = 8 -- columns to keep to the left and right of the cursor

-- Backups
o.swapfile = true     -- store the things you change in a swap file
o.updatecount = 20    -- after typing this many characters the swap file will be written
o.updatetime = 200    -- if this many milliseconds nothing is typed, the swap file will be written
o.backup = false      -- make backups of the original file after edit it
o.writebackup = false -- make a backup before overwriting a file
o.undofile = true     -- save undo history to an undo file

-- Indentation and formatting
o.shiftwidth = 4     -- number of spaces to use for each step of (auto)indent
o.tabstop = 4        -- number of spaces that a <Tab> in the file counts for
o.smarttab = false   -- when on, a <Tab> in front of a line inserts space
o.smartindent = true -- do smart auto indent when starting a new line
o.autoindent = true  -- copy indent from current line when starting a new line
o.textwidth = 80     -- default maximum text width

-- Window
o.splitbelow = true -- force all horizontal splits to open below current window
o.splitright = true -- force all vertical splits to open in the right of the current window

-- Folding
o.foldlevelstart = 99 -- default folding level
o.foldmethod = "expr" -- folding method

-- netrw plugin (file explorer)
g.netrw_liststyle = 3 -- change default directory view
g.netrw_banner = 0    -- hide banner

--[[
	VimWiki
--]]

g.vimwiki_list = {{
	syntax = "markdown",
	ext = ".md",
	path = "~/Documents",
	diary_rel_path = "journal/",
	path_html = "~/Documents/wiki-html/exported",
	template_path = "~/Documents/wiki-html/templates",
	template_ext = ".html",
	template_default = "default",
	css_name = "../style.css",
	custom_wiki2html = "vimwiki_markdown"
}}

-- Enable folding for VimWiki
g.vimwiki_folding = "expr"

-- Symbols to show progression of todo list items
g.vimwiki_listsyms = " .oOX"
g.vimwiki_listsym_rejected = "-"

-- Open external files with Vimwiki links
-- NOTE: cannot convert it to a Lua function.
vim.cmd([[
	function! VimwikiLinkHandler(link)
		let link = a:link
		if link =~# '^vfile:'
			let link = link[1:]
		else
			return 0
		endif
		let link_infos = vimwiki#base#resolve_link(link)
		if link_infos.filename == ''
			echomsg 'Vimwiki Error: Unable to resolve link!'
			return 0
		else
			exe 'tabnew ' . fnameescape(link_infos.filename)
			return 1
		endif
	endfunction
]])
