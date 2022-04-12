require('plugins')
require('global')
require('settings')
require('keymappings')

vim.cmd('luafile ~/.config/nvim/settings.lua')

require('colorscheme')

-- Plugins
require('nvimtree')
require('devicon')
require('floatterm')
require('fzf')
require('treesitter')
require('statusline')
-- LSP
require('lsp')
require('lsp.jsonls')
-- require('lsp.pyright')
require('lsp.golang')
