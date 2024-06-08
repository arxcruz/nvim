vim.api
    .nvim_set_keymap('n', '<Space>', '<NOP>', {noremap = true, silent = true})
vim.g.mapleader = ','

-- Quit current window and all windows
vim.api.nvim_set_keymap('n', '<Leader>x', ':quit<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>e', ':Bdelete<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<Leader>E', ':qa!<CR>',
                        {noremap = true, silent = true})

-- nvim-tree
vim.api.nvim_set_keymap('n', '<Space>e', ':NvimTreeToggle<CR>',
                        {noremap = true, silent = true})

-- Window movement
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', {silent = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', {silent = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', {silent = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', {silent = true})

-- Quicksave commands
vim.api.nvim_set_keymap('n', '<C-Z>', ':update<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-Z>', '<C-C>:update<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-Z>', '<C-O>:update<CR>',
                        {noremap = true, silent = true})

-- Easier moving between buffers
vim.api.nvim_set_keymap('n', '<Leader>n', '<esc>:tabprevious<CR>',
                        {silent = true})
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
vim.api.nvim_set_keymap('n', 'fg', ':Telescope live_grep<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'fb', ':Telescope buffers<CR>', {silent = true})
vim.api.nvim_set_keymap('n', 'fd', ':Telescope diagnostics<CR>', {silent = true})

-- Git
vim.cmd('ca gr !git review')
vim.cmd('ca gca Git commit --amend')
vim.cmd('ca gc Git commit')

-- LSP
local m = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, '<cmd> ' .. result .. '<cr>',
                                {noremap = true, silent = true})
end

vim.api.nvim_set_keymap("n", "gm", "<cmd>lua format_range_operator()<CR>", {noremap = true})
m('n', 'ga', 'lua vim.lsp.buf.code_action()')
m('n', 'gD', 'lua vim.lsp.buf.declaration()')
m('n', 'gd', 'lua vim.lsp.buf.definition()')
m('n', 'ge', 'lua vim.diagnostic.goto_next()')
m('n', 'gE', 'lua vim.diagnostic.goto_prev()')
m('n', 'gi', 'lua vim.lsp.buf.implementation()')
m('n', 'gr', 'lua vim.lsp.buf.references()')
m('n', 'K', 'lua vim.lsp.buf.hover()')
-- m("n", "<space>rn", "lua vim.lsp.buf.rename()")
-- vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { noremap = true, silent = true })
m('n', '<space>l', 'lua vim.diagnostic.open_float()')
m('n', '<space>f', 'lua vim.lsp.buf.format()')
m('v', '<space>f', 'lua vim.lsp.buf.range_formatting()')
m('n', '<space>q', 'lua vim.diagnostic.setloclist()')
