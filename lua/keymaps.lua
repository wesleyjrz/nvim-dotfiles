--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

local key = vim.keymap.set
local keys = vim.keymap.set_keys
local noremap = { noremap = true }
local silent = { noremap = true, silent = true }
local expr = { noremap = true, expr = true }
local normal_insert = { "n", "i" }

-- Set <Space> as the leader key
vim.g.mapleader = " "

-- Emacs-like cancel key
key(normal_insert, "<C-g>", "<Esc>", noremap)

-- Hide search highlights
keys("n", { "<Esc>", "<C-g>" }, "<cmd>nohlsearch<CR>", silent)

-- Encrypt text with ROT13 encoding
key("v", "<Leader>?", "g?", noremap)

--[[
	IDE-like keys

	Keys inspired by most IDE defaults.
--]]

-- Undo changes
key("n", "<C-z>", "<cmd>undo<CR>", noremap)
key("i", "<C-z>", "<Esc><cmd>undo<CR>a", noremap)

-- Save file
key(normal_insert, "<C-s>", "<Esc><cmd>write!<CR>", noremap)

-- Quit Neovim
key(normal_insert, "<C-q>", "<Esc><cmd>quitall!<CR>", noremap)

--[[
	Navigation keys

	Keys to navigate easily.
--]]

-- Navigate on visual lines, unless when jumping a number of lines
key("n", "j", "v:count ? 'j' : 'gj'", expr)
key("n", "k", "v:count ? 'k' : 'gk'", expr)

-- Window navigation
key("n", "<A-h>", "<cmd>wincmd h<CR>", silent)
key("n", "<A-j>", "<cmd>wincmd j<CR>", silent)
key("n", "<A-k>", "<cmd>wincmd k<CR>", silent)
key("n", "<A-l>", "<cmd>wincmd l<CR>", silent)

-- Terminal window navigation
key("t", "<A-j>", "<C-\\><C-n><cmd>wincmd j<CR>", noremap)
key("t", "<A-k>", "<C-\\><C-n><cmd>wincmd k<CR>", noremap)

-- Exchange window
key("n", "<A-x>", "<cmd>wincmd x<CR>", silent)

-- Move window
key("n", "<A-S-h>", "<cmd>wincmd H<CR>", silent)
key("n", "<A-S-j>", "<cmd>wincmd J<CR>", silent)
key("n", "<A-S-k>", "<cmd>wincmd K<CR>", silent)
key("n", "<A-S-l>", "<cmd>wincmd L<CR>", silent)

-- Split window
key("n", "<A-s>", "<cmd>split<CR>", silent)
key("n", "<A-v>", "<cmd>vsplit<CR>", silent)

-- Resize window
key("n", "<A-Up>", "<cmd>resize +2<CR>", silent)
key("n", "<A-Down>", "<cmd>resize -2<CR>", silent)
key("n", "<A-Left>", "<cmd>vertical resize -2<CR>", silent)
key("n", "<A-Right>", "<cmd>vertical resize +2<CR>", silent)

-- Close window
key("n", "<A-q>", "<cmd>close!<CR>", silent)

--[[
	Toggle options

	Keybindings to toggle Neovim options.
--]]

-- Toggle spell checker
key("n", "<Leader>ts",
	function()
		vim.opt_local.spell = not(vim.opt_local.spell:get())
		if vim.o.spell then
			print("Spell checker enabled")
		else
			print("Spell checker disabled")
		end
	end,
noremap)


-- Toggle text autoformatting
key("n", "<Leader>tf",
	function()
		if toggle_flag("formatoptions", "t") then
			print("Text autoformatting enabled")
		else
			print("Text autoformatting disabled")
		end
	end,
noremap)

--[[
	Folding
--]]

-- Toggle fold
key("n", "<Tab>", "za", silent)

-- Toggle fold recursively
key("n", "<S-Tab>", "zA", silent)

-- Toggle all folds
key("n", "<Leader><Tab>",
	function()
		local get_opt = vim.api.nvim_win_get_option
		local set_opt = vim.api.nvim_win_set_option

		if get_opt(0, "foldlevel") >= 99 then
			set_opt(0, "foldlevel", 0)
		else
			set_opt(0, "foldlevel", 99)
		end
	end,
silent)

--[[
	Barbar
--]]

-- Tab navigation
key("n", "<A-n>", "<cmd>BufferNext<CR>", silent)
key("n", "<A-p>", "<cmd>BufferPrevious<CR>", silent)

-- Magick buffer-picking
key("n", "<A-f>", "<cmd>BufferPick<CR>", silent)

-- Move tabs
key("n", "<A-S-n>", "<cmd>BufferMoveNext<CR>", silent)
key("n", "<A-S-p>", "<cmd>BufferMovePrevious<CR>", silent)

-- Pin tab
key("n", "<A-'>", "<cmd>BufferPin<CR>", silent)

-- Close tab
key("n", "<A-e>", "<cmd>BufferClose!<CR>", silent)

-- Close all tabs but current or pinned
key("n", "<A-S-e>", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", silent)

--[[
	Comment
--]]

-- Toggle comments
toggle_cmt = "gcc"

-- Comment leaders
cmt_leader = "gc"
block_cmt_leader = "gb"

-- Extra comment keys
cmt_above = "gcO"
cmt_below = "gco"
cmt_end = "gcA"

-- Extra block comment keys
key("n", "gbO",
	"<cmd>lua require('Comment.api').insert.blockwise.above()<CR>",
silent)
key("n", "gbo",
	"<cmd>lua require('Comment.api').insert.blockwise.below()<CR>",
silent)

--[[
	Align
--]]

-- Aligns to a string, looking left and with preview
key("x", "al",
	function()
		require("align").align_to_string(false, true, true)
	end,
silent)

--[[
	Completion
--]]

-- Show available completions / Close completion menu
cmp_toggle = "<C-Space>"

-- Select next/previous item
cmp_next = "<C-n>"
cmp_previous = "<C-p>"

-- Scroll menu docs
cmp_scroll_down = "<C-j>"
cmp_scroll_up = "<C-k>"

-- Confirm completion
cmp_confirm = "<C-l>"

--[[
	LuaSnip
--]]

-- Navigate between snippet fields
key("n", "<C-n>", "<cmd>lua require('luasnip').jump(1)<CR>", noremap)
key("n", "<C-p>", "<cmd>lua require('luasnip').jump(-1)<CR>", noremap)

--[[
	LSP and Trouble
--]]

-- Navigate between diagnostics
key("n", "<Leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", noremap)
key("n", "<Leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", noremap)

-- Open Trouble with diagnostics
key("n", "<Leader>D", "<cmd>TroubleToggle<CR>", noremap)
key("n", "<Leader>dw", "<cmd>TroubleToggle workspace_diagnostics<CR>", noremap)
key("n", "<Leader>dd", "<cmd>TroubleToggle document_diagnostics<CR>", noremap)
key("n", "<Leader>dl", "<cmd>TroubleToggle loclist<CR>", noremap)
key("n", "<Leader>dq", "<cmd>TroubleToggle quickfix<CR>", noremap)
key("n", "<Leader>dr", "<cmd>TroubleToggle lsp_references<CR>", noremap)

trouble_close = { "<A-q>", "<A-e>" }
trouble_cancel = { "<Esc>", "<C-g>" }
trouble_refresh = "zz"
trouble_jump = { "<CR>", "<Tab>" }
trouble_jump_and_close = "o"
trouble_toggle_mode = "m"
trouble_hover = "<C-Space>"

-- Display all references for the symbol
key("n", "<Leader>dr", "<cmd>lua vim.lsp.buf.references()<CR>", noremap)

-- Rename a variable
key("n", "cv", "<cmd>lua vim.lsp.buf.rename()<CR>", noremap)

--[[
	Sniprun
--]]

-- Run snippet
key("v", "<Leader>R", "<cmd>SnipRun<CR>", silent)

-- Run file
key("n", "<Leader>R",
	"<cmd>mkview<CR><cmd>%SnipRun<CR><cmd>loadview<CR>",
silent)

--[[
	Telescope
--]]

-- Find files
key("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", silent)

-- Find grep
key("n", "<Leader>fg", "<cmd>Telescope live_grep<CR>", silent)

-- Find commands
key("n", "<Leader>fc", "<cmd>Telescope commands<CR>", silent)

-- Find help
key("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", silent)

-- Find projects
key("n", "<Leader>fp",
	"<cmd>lua require('telescope').extensions.project.project{}<CR>",
silent)

-- Close Telescope
telescope_close = "<A-q>"

-- Scroll results (insert mode)
telescope_scroll_down = "<C-n>"
telescope_scroll_up = "<C-p>"

-- Open file (normal mode)
telescope_file_edit = "e"
telescope_file_split = "s"
telescope_file_vsplit = "v"

-- Scroll preview (normal mode)
telescope_preview_scroll_down = "<C-j>"
telescope_preview_scroll_up = "<C-k>"

-- Toggle selection (normal mode)
telescope_toggle_selection = "<Space>"
telescope_toggle_all = "<S-v>"

-- Toggle previewer
telescope_toggle_preview = "<C-Space>"

--[[
	Terminal
--]]

-- Toggle terminal
toggle_term_cmd = "<C-\\><C-n><cmd>lua NTGlobal['terminal']:toggle()<CR>"

key("n", "<Leader>tt", toggle_term_cmd, noremap)
key("t", "<A-q>", toggle_term_cmd, noremap)

-- Exit terminal mode (insert mode on terminal)
keys("t", { "<Esc>", "<C-g>" }, "<C-\\><C-n>", noremap)

--[[
	Zen mode
--]]

-- Toggle zen mode
key("n", "<Leader>z", "<cmd>ZenMode<CR>", noremap)

--[[
	Carbon Now
--]]

key({ "n", "v" }, "<Leader>cn", "<cmd>CarbonNow<CR>", silent)
