require('plugins')
require('global')
require('settings')
require('keymappings')

vim.cmd('luafile ~/.config/nvim/settings.lua')

require('colorscheme')

-- Plugins
require('nvimtree')
require('nvimcmp')
require('devicon')
require('floatterm')
require('fzf')

-- LSP
require('lsp')
require('lsp.jsonls')
require('lsp.pyright')
-- require('lsp.pylsp')
require('lsp.golang')
