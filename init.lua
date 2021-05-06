require('plugins')
require('global')
require('settings')
require('keymappings')
vim.cmd('luafile ~/.config/nvim/settings.lua')
require('colorscheme')

-- Plugins
require('nvimtree')
require('nvimcompe')
require('devicon')
require('floatterm')
-- LSP
require('lsp')
require('lsp.pyright')
require('lsp.golang')
require('lspsaga')
