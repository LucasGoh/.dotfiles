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



local function switch_to_next_buffer()
    vim.api.nvim_command("bnext")
end

vim.api.nvim_set_keymap("n", "<Tab>", "<Cmd>lua switch_to_next_buffer()<CR>", {})
