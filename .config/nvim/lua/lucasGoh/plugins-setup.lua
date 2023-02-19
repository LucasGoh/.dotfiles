local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-lua/plenary.nvim", -- lua functions that many plugins use

	{ -- LSP Configuration & Plugins
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",

			-- Useful status updates for LSP
			"j-hui/fidget.nvim",

			-- Additional lua configuration, makes nvim stuff amazing
			"folke/neodev.nvim",

			-- c cpp rust debugger
			--		"llvm/llvm-project",
		},
	},

	-- -- usage: :TS<tab>  ex--> TSInstallInfo (show installed languages)
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = function()
			pcall(require("nvim-treesitter.install").update({ with_sync = true }))
		end,

		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects", "windwp/nvim-ts-autotag" },
	},

	-- { -- Additional text objects via treesitter
	--     "nvim-treesitter/nvim-treesitter-textobjects",
	--     after = "nvim-treesitter",
	-- },
	--
	"mfussenegger/nvim-dap", -- debugger
	{ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } }, -- A UI for nvim-dap which provides a good out of the box configuration.
	"theHamsta/nvim-dap-virtual-text", -- support to nvim-dap.

	----------
	"bluz71/vim-nightfly-guicolors", --preferred color scheme

	-- use Ctrl+hjkl to jump between panes
	-- configure in keymaps
	"christoomey/vim-tmux-navigator", -- tmux & split window navigation

	-- configure in keymaps.lua
	"szw/vim-maximizer", -- maximizes and restores current window

	-- essential plugins---->>>> read documentation
	"tpope/vim-surround", -- add, delete, change surroundings (it's awesome)
	"inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)

	-- commenting with gc
	-- config---> in plugins/comment.lua
	-- usage: gcc comment online;  gc9j  comment 9lines;  redo cancel
	"numToStr/Comment.nvim",

	-- file explorer
	-- config-->in plugins/nvim-tree.lua
	-- keymaps: changed to <leader>e
	-- usage:NvimTree*[tab]  ex: NvimTreeToggle
	-- in toogle mode "a" to add file, and enter name of the file
	"nvim-tree/nvim-tree.lua",

	-- vs-code like icons
	"nvim-tree/nvim-web-devicons",

	-- statusline
	-- config ---> under plugins
	"nvim-lualine/lualine.nvim",

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" }, -- dependency for better sorting performance
	{ "nvim-telescope/telescope.nvim", branch = "0.1.x" }, -- fuzzy finder

	-- autocompletion
	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		-- by orer -- make it appear in autocompletion, snippet engine, for autocompletion
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		-- opts = function(_, opts)
		-- 	-- original LazyVim kind icon formatter
		-- 	local format_kinds = opts.formatting.format
		-- 	opts.formatting.format = function(entry, item)
		-- 		format_kinds(entry, item) -- add icons
		-- 		return require("tailwindcss-colorizer-cmp").formatter(entry, item)
		-- 	end
		-- end,
	},

	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},

	"onsails/lspkind-nvim", -- vscode-like pictograms
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	-- snippets
	"rafamadriz/friendly-snippets", -- useful snippets

	-- usage: dd to see definition of a function---> then if you want to see then <ENTER> ---> then if you wanna go back <C-o> and <C-i> go back and forth
	{ "glepnir/lspsaga.nvim", branch = "main" }, -- enhanced lsp Uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting (Automatically)
	-- config: plugin/lsp/null-ls.lua
	"jose-elias-alvarez/null-ls.nvim", -- configure formatters & linters
	"jayp0521/mason-null-ls.nvim", -- bridges gap b/w mason & null-ls

	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...
	-- { "windwp/nvim-ts-autotag", after = "nvim-treesitter" }, -- autoclose tags

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side

	{
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{ -- https://www.youtube.com/watch?v=_NiWhZeR-MY&t=34s
		"NvChad/nvim-colorizer.lua",
		-- config = function()
		-- 	require("colorizer").setup({
		-- 		user_default_options = {
		-- 			tailwind = true,
		-- 		},
		-- 	})
		-- end,
		opts = { -- same thing, but concise in lazyVim
			user_default_options = {
				tailwind = true,
			},
		},
	},
})
