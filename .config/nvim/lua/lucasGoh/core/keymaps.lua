-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------
-- i = insert mode;  n = normal mode;
-- <CR> means enter

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "increment a number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "decrease a number" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "make split windows equal width & height" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "close current split window" })

-- Diagnostic keymaps
keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "go to prev diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "go to next diagnostic" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "diagnostic.open_float" })
keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "diagnostic.setloclist" })

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>") -- toggle split window maximization

-- nvim-tree
-- keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags
keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>") -- list diagnostics

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

-- See `:help telescope.builtin`
keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })

-- change theme
vim.keymap.set("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

-- debugging
keymap.set("n", "<C-F5>", function()
	require("dap").continue()
end, { desc = "dap.continue" })
keymap.set("n", "<F10>", function()
	require("dap").step_over()
end, { desc = "dap.step_over" })
keymap.set("n", "<F11>", function()
	require("dap").step_into()
end, { desc = "dap.step_into" })
keymap.set("n", "<F12>", function()
	require("dap").step_out()
end, { desc = "step_out" })
keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end, { desc = "dap.toggle_breakpoint" })
keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end, { desc = "dap.set_breakpoint" })
keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "dap.set_breakpoint" })
keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end, { desc = "dap.repl.open()" })
keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end, { desc = "dap.run_last" })

--dap.ui
keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end, { desc = "dap.ui.widgets.hover" })
keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end, { desc = "dap.ui.widgets.preview" })
keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end, { desc = "dap.ui  float" })
keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end, { desc = "dap.ui scope" })
