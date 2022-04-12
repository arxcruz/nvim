vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ','

-- Quit current window and all windows
vim.api.nvim_set_keymap('n', '<Leader>e', ':quit<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>E', ':qa!<CR>', {noremap = true, silent = true})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Quicksave commands
vim.api.nvim_set_keymap('n', '<C-Z>', ':update<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-Z>', '<C-C>:update<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-Z>', '<C-O>:update<CR>', {noremap = true, silent = true})

-- Easier moving between buffers
vim.api.nvim_set_keymap('n', '<Leader>n', '<esc>:tabprevious<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<Leader>m', '<esc>:tabnext<CR>', {silent = true})

-- Moving of code blocks
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- Insert new line and paste content bellow
vim.api.nvim_set_keymap('n', '<Leader>p', 'o<esc>P', {silent = true})

-- Toggle gitblame
vim.api.nvim_set_keymap('n', '<F9>', ':GitBlameToggle<CR>', {silent = true})

-- Telescope
vim.api.nvim_set_keymap('n', 'ff', ':Telescope find_files<CR>', {silent = true})
