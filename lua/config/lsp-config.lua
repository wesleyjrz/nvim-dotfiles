local lsp = require "lspconfig"
local sumneko_runtime_path = vim.split(package.path, ";")
table.insert(sumneko_runtime_path, "lua/?.lua")
table.insert(sumneko_runtime_path, "lua/?/init.lua")

-- Disable inline diagnostics by default
vim.diagnostic.config({ virtual_text = false })

--[[
	Bash script
--]]
lsp.bashls.setup{}

--[[
	C, C++ and Objective-C
--]]
lsp.ccls.setup{}

--[[
	Lua
--]]
lsp.sumneko_lua.setup {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = sumneko_runtime_path
			},
			-- Get the language server to recognise the `vim` global
			diagnostics = {
				disable = {
					"lowercase-global",
					"codestyle-check",
					"spell-check"
				},
				globals = { "vim" }
			},
			completion = {
				enable = true,
				callSnippet = "Disable",
				keywordSnippet = "Disable", -- let snippet plugin handle it
			},
			format = { enable = false },
			hint = { enable = false },
			hover = { enable = false },
			workspace = {
				-- Check third party libraries
				checkThirdParty = true,
				-- Make the server aware of Neovim runtime files
				library = { vim.api.nvim_get_runtime_file("", true) }
			},
			-- Do not send telemetry data
			telemetry = { enable = false }
		}
	}
}

--[[
	Python
--]]
lsp.pyright.setup {
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = "workspace",
			useLibraryCodeForTypes = true
		}
	}
}

-- Fancy diagnostic icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
