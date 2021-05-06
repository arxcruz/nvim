local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

local my = function(file) require(file) end

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

require('packer').init({display = {auto_clean = false}})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'

    -- Git
    use 'tpope/vim-fugitive'
    use 'f-person/git-blame.nvim'

    -- Themes
    use 'trevordmiller/nova-vim'
    use 'cocopon/iceberg.vim'

    -- Explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- Visual
    use 'dstein64/nvim-scrollview'
    use 'sheerun/vim-polyglot'

    -- Auto complete
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'

    -- Terminal
    use 'voldikss/vim-floaterm'
end)
