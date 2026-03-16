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

-- Disable backtick to avoid conflict with Moonlander layer switching
vim.api.nvim_set_keymap('n', '`', '<NOP>', {noremap = true, silent = true})

-- Quicksave commands
vim.api.nvim_set_keymap('n', '<C-Z>', ':update<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<C-Z>', '<C-C>:update<CR>',
                        {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-Z>', '<C-O>:update<CR>',
                        {noremap = true, silent = true})

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
vim.o.updatetime = 250
local group = vim.api.nvim_create_augroup('OoO', {})

local function au(typ, pattern, cmdOrFn)
	if type(cmdOrFn) == 'function' then
		vim.api.nvim_create_autocmd(typ, { pattern = pattern, callback = cmdOrFn, group = group })
	else
		vim.api.nvim_create_autocmd(typ, { pattern = pattern, command = cmdOrFn, group = group })
	end
end

_G.diag_float_opts = {
	focusable = false,
	close_events = { 'BufLeave', 'CursorMoved', 'InsertEnter', 'CursorMovedI' },
	border = 'rounded',
	source = 'always', -- added to show which LSP provides the diagnostic
	scope = 'cursor',
}

_G.diag_auto_float_enabled = true
_G.toggle_diag_float = function()
  _G.diag_auto_float_enabled = not _G.diag_auto_float_enabled
  print("Auto diagnostic float: " .. (_G.diag_auto_float_enabled and "Enabled" or "Disabled"))
end

au({ 'CursorHold', 'InsertLeave' }, '*', function()
  if _G.diag_auto_float_enabled then
	  vim.diagnostic.open_float(nil, diag_float_opts)
  end
end)

au('InsertEnter', '*', function()
	vim.diagnostic.enable(false)
end)

au('InsertLeave', '*', function()
	vim.diagnostic.enable(true)
end)

local m = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, '<cmd> ' .. result .. '<cr>',
                                {noremap = true, silent = true})
end

vim.api.nvim_set_keymap("n", "gm", "<cmd>lua format_range_operator()<CR>", {noremap = true})

_G.goto_next_diag = function()
  vim.diagnostic.goto_next({ float = diag_float_opts })
end
_G.goto_prev_diag = function()
  vim.diagnostic.goto_prev({ float = diag_float_opts })
end

-- m("n", "<space>rn", "lua vim.lsp.buf.rename()")
-- vim.keymap.set("n", "<space>f", vim.lsp.buf.format, { noremap = true, silent = true })
m('n', '<space>l', 'lua vim.diagnostic.open_float(nil, diag_float_opts)')
m('n', '<space>f', 'lua vim.lsp.buf.format()')
m('v', '<space>f', 'lua vim.lsp.buf.range_formatting()')
m('n', '<space>q', 'lua vim.diagnostic.setloclist()')

-- LSP / Diagnostics
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })
vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, { noremap = true, silent = true })
vim.keymap.set('n', '[d', _G.goto_prev_diag, { noremap = true, silent = true })
vim.keymap.set('n', ']d', _G.goto_next_diag, { noremap = true, silent = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, silent = true })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true, silent = true })
vim.keymap.set('n', 'grr', vim.lsp.buf.references, { noremap = true, silent = true })
vim.keymap.set('n', 'grn', vim.lsp.buf.rename, { noremap = true, silent = true })

vim.keymap.set('n', '<leader>dt', _G.toggle_diag_float, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dh', vim.diagnostic.hide, { noremap = true, silent = true })
vim.keymap.set('n', '<leader>dl', function() vim.diagnostic.open_float(nil, diag_float_opts) end, { noremap = true, silent = true })

-- Buffer navigation
vim.keymap.set('n', 'H', ':bp<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'L', ':bn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<tab>', ':tabnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-tab>', ':tabprevious<CR>', { noremap = true, silent = true })

