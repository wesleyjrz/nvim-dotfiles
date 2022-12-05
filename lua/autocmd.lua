--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/
   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

local au = vim.api.nvim_create_autocmd
local aug = vim.api.nvim_create_augroup

--[[
	Augroups

	Groups of autocommands.
--]]

-- Editor or individual file/filetype options
local options = aug("FileOptions", { clear = false })

-- Automation group
local automation = aug("EditorAutomation", { clear = false })

--[[
	Remember last view (position, foldings, etc)
--]]
au("BufWinLeave", {
	command = [[ silent! mkview ]],
	group = options
})
au("BufWinEnter", {
	command = [[ silent! loadview ]],
	group = options
})

--[[
	Formatting options

	NOTE: This can't be done in the options file because ftplugin overrides the
	option when Neovim starts. See 'fo-table' for more info about options.
--]]
au("BufEnter", {
	command = [[
		set formatoptions-=o
		set formatoptions-=r
		set formatoptions-=l
	]],
	group = options
})

--[[
	Markdown options
--]]
au("BufEnter", {
	pattern = "*.md",
	command = [[
		setlocal nowrap
		setlocal expandtab
		setlocal shiftwidth=2
		setlocal softtabstop=2
		setlocal spell
		setlocal formatoptions+=p
		setlocal formatoptions+=n
	]],
	group = options
})

--[[
	LaTeX options

	NOTE: I'm setting 'syntax=tex' as a workaround whilst tree-sitter doesn't
	know the difference of text and code when highlighting spell errors.
--]]
au("BufEnter", {
	pattern = "*.tex",
	command = [[
		setlocal indentexpr=
		setlocal syntax=tex
		setlocal spell
	]],
	group = options
})

--[[
	Terminal window options
--]]
au("TermOpen", {
	command = [[
		startinsert!
		setlocal nonumber
		setlocal norelativenumber
		setlocal nocursorline
	]],
	group = options
})

--[[
	Set custom VimWiki header colours
--]]
au("FileType vimwiki", {
	command = [[
		highlight VimwikiHeader1 guifg=#a3be8c
		highlight VimwikiHeader2 guifg=#8fbcbb
		highlight VimwikiHeader3 guifg=#88c0d0
		highlight VimwikiHeader4 guifg=#81a1c1
		highlight VimwikiHeader5 guifg=#5e81ac
	]],
	group = options
})

--[[
	Remove all trailing whitespaces and trim blank lines at the end of file
--]]
au("BufWritePre", {
	command = [[ %s/\s\+$//e | %s/\($\n\s*\)\+\%$//e ]],
	group = automation
})

--[[
	Compile Packer automatically when saving plugins file
--]]
au("BufWritePost", {
	pattern = "plugins.lua",
	command = [[ PackerCompile ]],
	group = automation
})

--[[
	Add new diary entries automatically when diary index is being saved
--]]
au("BufWritePre", {
	pattern = "diary.md",
	command = [[ VimwikiDiaryGenerateLinks ]],
	group = automation
})

--[[
	Open diagnostic floating window with cursor hover
--]]
au("CursorHold", {
	callback = function ()
		for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
			if vim.api.nvim_win_get_config(winid).zindex then
				return
			end
		end
		vim.diagnostic.open_float({focusable = false})
	end,
	group = automation
})
