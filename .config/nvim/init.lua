require("lucasGoh.plugins-setup")
require("lucasGoh.core.options")
require("lucasGoh.core.keymaps")
require("lucasGoh.plugins.comment")
require("lucasGoh.plugins.nvim-tree")
require("lucasGoh.plugins.lualine")
require("lucasGoh.plugins.telescope")
require("lucasGoh.plugins.nvim-cmp")

--lsp
require("lucasGoh.plugins.lsp.mason")
require("lucasGoh.plugins.lsp.lspsaga")
require("lucasGoh.plugins.lsp.lspconfig")

--formatting & linting
require("lucasGoh.plugins.lsp.null-ls")

--Treesitter highlighting & autoclosing
require("lucasGoh.plugins.autopairs")
require("lucasGoh.plugins.treesitter")

--gitsigns
require("lucasGoh.plugins.gitsigns")

require("lucasGoh.plugins.fidget")

require("lucasGoh.plugins.dap")
require("lucasGoh.plugins.dapui")
require("lucasGoh.plugins.dapVirtualText")

require("lucasGoh.plugins.whichkey")

-- Set the highlight groups for transparent backgrounds
vim.cmd("highlight Normal ctermbg=none guibg=none")
vim.cmd("highlight NonText ctermbg=none guibg=none")
vim.cmd("highlight SignColumn ctermbg=none guibg=none")
vim.cmd("highlight VertSplit ctermbg=none guibg=none")
