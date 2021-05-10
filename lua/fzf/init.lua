vim.api.nvim_set_keymap('n', '<Leader>f', '<esc><esc>:Files!<CR>', {silent = true})
vim.api.nvim_set_keymap('i', '<Leader>f', '<esc><esc>:BLines!<CR>', {silent = true})
vim.api.nvim_set_keymap('n', '<C-g', '<esc><esc>:GCommits!<CR', {silent = true})
