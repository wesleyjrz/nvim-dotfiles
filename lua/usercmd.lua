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
local usercmd = vim.api.nvim_buf_create_user_command
local key = vim.keymap.set
local silent = { noremap = true, silent = true }

-- Augroup
local cmd = vim.api.nvim_create_augroup("UserCommands", { clear = false })

--[[
	Run LOVE2D projects
--]]
au("BufEnter", {
	pattern = "*.lua",
	callback = function()
		usercmd(0, "LoveRun", [[ silent !love %:p:h ]], {})
		key("n", "<Leader>lr", "<cmd>LoveRun<CR>", silent)
	end,
	group = cmd
})

--[[
	Compile LaTeX to PDF

	FIXME: `pdflatex` doesn't save the file in its directory if you're
	in another working directory.
--]]
au("BufEnter", {
	pattern = "*.tex",
	callback = function()
		usercmd(0, "Latex2PDF", [[
			silent !pdflatex %:p -o %:p:r.pdf && pkill --signal SIGHUP mupdf
		]], {})
		usercmd(0, "Latex2PDFOpen", [[
			silent !pdflatex %:p -o %:p:r.pdf && pkill --signal SIGHUP mupdf
			!mupdf-x11 %:p:r.pdf &
		]], {})
		key("n", "<Leader>R", "<cmd>Latex2PDF<CR>", silent)
		key("n", "<Leader>lr", "<cmd>Latex2PDFOpen<CR>", silent)
	end,
	group = cmd
})
