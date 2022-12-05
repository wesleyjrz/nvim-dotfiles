--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

-- Load configuration files
require "utils"

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath("config").."/lua", [[v:val =~ "\.lua$"]])) do
	require(file:gsub("%.lua$", ""))
end
