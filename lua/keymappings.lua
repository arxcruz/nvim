vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ','

-- Quit current window and all windows
vim.cmd([[
  noremap <Leader>e :quit<CR>
  noremap <Leader>E :qa!<CR>
]])


-- nvim-tree
vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
