vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_gitignore = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_hide_dotfiles = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_width_allow_resize  = 1

vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 0,
    icons = 1,
}
require'nvim-tree'.setup {
    auto_open = false,
    auto_close = false,
    hijack_netrw = true,
    ignore_list = {'.git', 'node_modules', '.cache'},
    ignore_ft_on_setup = {'startify', 'dashboard'},
    open_on_tab = true,
    view = {
        width = 40,
    }
}

-- Remove the ugly red vertical bar
vim.cmd('autocmd! FileType NvimTree setlocal signcolumn=no')
