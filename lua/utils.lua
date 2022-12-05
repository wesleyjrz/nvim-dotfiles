--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

vim.abbrev = {}

--[[
	Map a table of keys to do the same action
--]]
function vim.keymap.set_keys(mode, keys, cmd, opts)
	for i in pairs(keys) do
		vim.keymap.set(mode, keys[i], cmd, opts)
	end
end

--[[
	Set Vim abbreviations
--]]
function vim.abbrev.set(abbrev, expand)
	vim.cmd("iab " .. abbrev .. " " .. expand)
end

--[[
	Toggle option flags

	Return true when option is added and false when it's removed.
--]]
function toggle_flag(option, value)
	if not string.find(vim.api.nvim_get_option(option), value) then
		vim.cmd("set " .. option .. "+=" .. value)
		return true
	else
		vim.cmd("set " .. option .. "-=" .. value)
		return false
	end
end
