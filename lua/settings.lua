vim.o.hidden = O.hidden_files
vim.wo.wrap = O.wrap_lines
vim.wo.number = O.number
vim.o.clipboard = "unnamedplus" -- Copy paste between vim and everything else
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.colorcolumn = "80"
vim.o.tw = 79

vim.cmd('set fo-=t')
-- Transform tabs in spaces
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.shiftround = true
vim.o.expandtab = true

-- Make search case insensitive
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

-- No Backup
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- All split window open bellow
vim.o.splitbelow = true
vim.o.showtabline = 2
vim.o.showmode = false
