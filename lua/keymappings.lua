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
