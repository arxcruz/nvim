vim.g.nvim_tree_width_allow_resize = 1

require 'nvim-tree'.setup {
    hijack_directories = {
        auto_open = false,
    },
    update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = { '.git', 'node_modules', '.cache' },
    },
    hijack_netrw = true,
    open_on_tab = true,
    view = { width = 40 },
    filters = { dotfiles = true },
    git = { ignore = true },
    renderer = { 
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        icons = { show = { git = true, folder = true, file = true, } },
        indent_markers = { enable = true },
        root_folder_modifier = ':~',
    },
    actions = { open_file = { quit_on_open = true } }
}

-- Remove the ugly red vertical bar
vim.cmd('autocmd! FileType NvimTree setlocal signcolumn=no')
