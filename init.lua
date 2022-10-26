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
-- require('fzf')
require('treesitter')
require('statusline')
require('whichkey')
require('telescopeconf')
require('_bufferline')
require('autopairs')

-- null-ls
require('nullls')
-- LSP
require('lsp')
require('luasnip-config')
require('lsp.jsonls')
require('lsp.golang')
