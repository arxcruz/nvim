local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'tamago324/nlsp-settings.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    -- Code snipsets
    use 'L3MON4D3/LuaSnip'
    use { 'saadparwaiz1/cmp_luasnip' }

    -- TreeSitter
    use 'nvim-treesitter/nvim-treesitter'

    -- Coding
    use 'windwp/nvim-autopairs'

    -- Commenter
    use {
        'numToStr/Comment.nvim',
        config = function() require('Comment').setup() end
    }

    -- Surround
    use 'tpope/vim-surround'

    -- Git
    use 'tpope/vim-fugitive'
    use 'f-person/git-blame.nvim'

    -- Themes
    use 'trevordmiller/nova-vim'
    use 'cocopon/iceberg.vim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    }
    -- Explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- Visual
    use 'dstein64/nvim-scrollview'

    -- Bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = '*',
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use 'moll/vim-bbye'

    -- telescope
    use({'nvim-telescope/telescope.nvim', requires = {'nvim-lua/plenary.nvim'}})
    use {'nvim-telescope/telescope-file-browser.nvim'}

    -- Which key
    use({
        'folke/which-key.nvim',
        config = function() require('which-key').setup({}) end
    })

    -- Terminal
    use 'voldikss/vim-floaterm'
    use 'christoomey/vim-tmux-navigator'
    use 'xiyaowong/nvim-transparent'
end)
