local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'tamago324/nlsp-settings.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    -- Commenter
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Git
    use 'tpope/vim-fugitive'
    use 'f-person/git-blame.nvim'

    -- Themes
    use 'trevordmiller/nova-vim'
    use 'cocopon/iceberg.vim'
    use {
        'nvim-lualine/lualine.nvim',
         requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    -- Explorer
    use 'kyazdani42/nvim-tree.lua'
    use 'kyazdani42/nvim-web-devicons'

    -- Visual
    use 'dstein64/nvim-scrollview'
    use 'onsails/lspkind-nvim'

    -- telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    --use 'sheerun/vim-polyglot'

    -- Auto complete

    -- Search
    use 'junegunn/fzf.vim'
    use 'junegunn/fzf'

    -- Terminal
    use 'voldikss/vim-floaterm'
    use 'christoomey/vim-tmux-navigator'
end)
