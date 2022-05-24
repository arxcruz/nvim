vim.g.nvim_tree_add_trailing = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_width_allow_resize = 1

vim.g.nvim_tree_show_icons = { git = 1, folders = 1, files = 0, icons = 1 }
require 'nvim-tree'.setup {
    hijack_directories = {
        auto_open = false,
        auto_close = false,
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
    },
    hijack_netrw = true,
    ignore_list = { '.git', 'node_modules', '.cache' },
    ignore_ft_on_setup = { 'startify', 'dashboard' },
    open_on_tab = true,
    view = { width = 40 },
    filters = { dotfiles = true },
    git = { ignore = true },
    renderer = { indent_markers = { enabled = true } },
    actions = { open_file = { quit_on_open = true } }
}

-- Remove the ugly red vertical bar
vim.cmd('autocmd! FileType NvimTree setlocal signcolumn=no')
