return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    local treesitter = require("nvim-treesitter")
    treesitter.setup()
    treesitter.install { 'java', 'c', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript', 'typescript', 'html', 'yaml' }

    vim.api.nvim_create_autocmd('FileType', {
      pattern = { 'java', 'c', 'lua', 'vim', 'vimdoc', 'query', 'elixir', 'heex', 'javascript', 'typescript', 'html', 'yaml' },
      callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- folds, provided by Neovim (I don't like folds)
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        -- vim.wo.foldmethod = 'expr'
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

  end
 }
-- require("nvim-treesitter.configs").setup({
--     ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python", "javascript" },
--     auto_install = false,
--     highlight = { enable = true, additional_vim_regex_highlighting = false },
--     incremental_selection = {
--         enable = true,
--         keymaps = {
--             init_selection = "<C-n>",
--             node_incremental = "<C-n>",
--             scope_incremental = "<C-s>",
--             node_decremental = "<C-m>",
--         }
--     }
-- })
