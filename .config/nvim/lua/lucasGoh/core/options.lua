local opt = vim.opt -- for conciseness

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus") -- useful when copy something within nvim to OS

-- splitwindows
opt.splitright = true
opt.splitbelow = true

-- treat "-" as whole word when you delete something like hello-hello
opt.iskeyword:append("-")

opt.incsearch = true

opt.scrolloff = 8 --never go to bottom

-- vim.api.nvim_set_keymap("n", "<Tab>", "<Cmd>lua switch_to_next_buffer()<CR>", {})
vim.api.nvim_command(" autocmd FileType markdown setlocal wrap")

-- Set the highlight groups for transparent backgrounds
vim.cmd("highlight Normal ctermbg=none guibg=none")
vim.cmd("highlight NonText ctermbg=none guibg=none")
vim.cmd("highlight SignColumn ctermbg=none guibg=none")
vim.cmd("highlight VertSplit ctermbg=none guibg=none")

-- automatically format after save
vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
