--[[
   Wesley Vieira S. Jr.

       ,= ,-_-. =.
      ((_/)o o(\_))
       `-'(. .)`-'
           \_/

   github.com/wesleyjrz
   gitlab.com/wesleyjrz
--]]

local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"

-- Bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({ "git", "clone", "https://github.com/wbthomason/packer.nvim", install_path })
end

--[[
	Load plugin configuration file
--]]
local function get_config(name)
	return string.format("require(\"config.%s\")", name)
end

--[[
	Plugins
--]]
local function init_packer()
	vim.cmd([[ packadd packer.nvim ]])
	return require("packer").startup(function(use)
		-- Packer: plugin manager (managed by itself)
		use {
			"wbthomason/packer.nvim",
			commit = "1457161",
			opt = true
		}

		-- Tree-sitter: incremental parsing of buffers
		use {
			"nvim-treesitter/nvim-treesitter",
			branch = "v0.8.1",
			run = ":TSUpdate",
			config = get_config("treesitter")
		}

		-- Stabilize: buffer content stabilizer
		use {
			"luukvbaal/stabilize.nvim",
			branch = "0.8",
			config = function() require("stabilize").setup() end
		}

		-- mkdir: create missing directories when saving a file
		use {
			"jghauser/mkdir.nvim",
			commit = "c55d1de"
		}

		-- exrc: local config file with confirmation
		use {
			"MunifTanjim/exrc.nvim",
			commit = "7e6a93d",
			config = function()
				require("exrc").setup({
					files = {
						".nvimrc",
						".nvimrc.lua",
						".exrc",
						".exrc.lua"
					},
				})
			end
		}

		-- Autopair: close pairs automatically
		use {
			"windwp/nvim-autopairs",
			commit = "6b6e35f",
			config = get_config("autopairs")
		}

		-- Autotag: close html tags automatically
		use {
			"windwp/nvim-ts-autotag",
			commit = "5bbdfda",
			requires = "nvim-treesitter/nvim-treesitter",
			opt = true,
			ft = { "html", "xml", "markdown" },
		}

		-- Comment: comment and uncomment easily
		use {
			"numToStr/Comment.nvim",
			tag = "*",
			requires = "nvim-treesitter/nvim-treesitter",
			config = get_config("comment")
		}

		-- Align: align lines to a character or string
		use {
			"Vonr/align.nvim",
			commit = "529d22b"
		}

		-- Rainbow brackets: colourful brackets
		use {
			"p00f/nvim-ts-rainbow",
			disable = true,
			commit = "064fd6c",
			requires = "nvim-treesitter/nvim-treesitter"
		}

		-- Lualine: statusline
		use {
			"nvim-lualine/lualine.nvim",
			commit = "3325d5d",
			requires = {
				"kyazdani42/nvim-web-devicons",
				{ "arkav/lualine-lsp-progress", commit = "56842d0" }
			},
			config = get_config("lualine")
		}

		-- Barbar: buffer tabs
		use {
			"romgrk/barbar.nvim",
			tag = "*",
			requires = "kyazdani42/nvim-web-devicons",
			config = get_config("barbar")
		}

		-- Zen Mode: code without any distractions
		use {
			"folke/zen-mode.nvim",
			commit = "6f5702d",
			config = get_config("zen-mode")
		}

		-- Colorizer: highlight colour codes
		use {
			"norcalli/nvim-colorizer.lua",
			commit = "35f1aad",
			config = get_config("colorizer")
		}

		-- Toggle terminal
		use {
			"s1n7ax/nvim-terminal",
			commit = "e058de4",
			config = get_config("terminal")
		}

		-- Pretty Fold: foldtext customisation
		use {
			"anuvyklack/pretty-fold.nvim",
			tag = "*",
			config = get_config("pretty-fold")
		}

		-- LSP config: configure Neovim Language Server Protocols
		use {
			"neovim/nvim-lspconfig",
			tag = "*",
			config = get_config("lsp-config")
		}

		-- Trouble: pretty diagnostics
		use {
			"folke/trouble.nvim",
			commit = "c4da921",
			requires = "kyazdani42/nvim-web-devicons",
			config = get_config("trouble")
		}

		-- nvim-cmp: completion engine
		use {
			"hrsh7th/nvim-cmp",
			tag = "*",
			requires = {
				"kyazdani42/nvim-web-devicons",

				-- LSP autocompletion
				"hrsh7th/cmp-nvim-lsp",

				-- Path autocompletion
				"hrsh7th/cmp-path",

				-- Neovim Lua autocompletion
				"hrsh7th/cmp-nvim-lua",

				-- Buffer words autocompletion
				"hrsh7th/cmp-buffer",

				-- VSC-like pictograms
				"onsails/lspkind.nvim"
			},
			config = get_config("completion")
		}

		-- LuaSnip: snippet engine
		use {
			"L3MON4D3/LuaSnip",
			requires = {
				-- Autocompletion support
				"saadparwaiz1/cmp_luasnip",

				-- Snippets collection
				"wesleyjrz/friendly-snippets"
			},
			config = function() require("luasnip.loaders.from_vscode").lazy_load() end
		}

		-- SnipRun: run code snippets on-the-fly
		use {
			"michaelb/sniprun",
			tag = "*",
			run = "bash ./install.sh",
			config = get_config("sniprun")
		}

		-- Telescope: find, filter, preview, pick
		use {
			"nvim-telescope/telescope.nvim",
			tag = "*",
			requires = {
				"kyazdani42/nvim-web-devicons",

				{ "nvim-lua/plenary.nvim", commit = "4b7e520" },
				"nvim-telescope/telescope-fzy-native.nvim",

				-- Navigate projects
				{ "nvim-telescope/telescope-project.nvim", commit = "ff4d3ce" },
			},
			config = get_config("telescope")
		}

		-- VimWiki: personal wiki
		use {
			"vimwiki/vimwiki",
			tag = "*"
		}

		-- Carbon Now: generate carbon snippets from selection
		use {
			"ellisonleao/carbon-now.nvim",
			tag = "*",
			config = get_config("carbon-now")
		}

		-- Nord: a superb theme
		use {
			"shaunsingh/nord.nvim",
			commit = "8bbb859",
			config = get_config("nord")
		}

		if packer_bootstrap then
			require("packer").sync()
		end
	end)
end

--[[
	Modified from code by dcampos
	https://github.com/wbthomason/packer.nvim/discussions/618#discussioncomment-1398238
--]]
local function lazy_packer()
  return setmetatable({}, {
	__index = function(_, key)
		init_packer()
		return require("packer")[key]
	end,

	__newindex = function(_, key, value)
		init_packer()
		require("packer")[key] = value
	end,
  })
end

_G._lazy_packer = lazy_packer()

vim.api.nvim_exec([[
	command! -nargs=* -complete=customlist,v:lua._lazy_packer.plugin_complete PackerInstall lua _lazy_packer.install(<f-args>)
	command! -nargs=* -complete=customlist,v:lua._lazy_packer.plugin_complete PackerUpdate lua _lazy_packer.update(<f-args>)
	command! -nargs=* -complete=customlist,v:lua._lazy_packer.plugin_complete PackerSync lua _lazy_packer.sync(<f-args>)
	command! PackerClean lua _lazy_packer.clean()
	command! PackerCompile packadd packer.nvim | lua _lazy_packer.compile()
	command! -nargs=+ -complete=customlist,v:lua._lazy_packer.loader_complete PackerLoad | lua _lazy_packer.loader(<q-args>)
]], false)
