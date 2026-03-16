local wk = require("which-key")

wk.setup({
    plugins = {
        marks = true,
        registers = true,
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = true,
            nav = true,
            z = true,
            g = true
        },
        spelling = {enabled = true, suggestions = 20}
    },
    win = {
        border = "rounded",
        position = "bottom",
    },
    layout = {
        height = {min = 4, max = 25},
        width = {min = 20, max = 50},
        spacing = 3
    },
})

-- Register all mappings
wk.add({
    -- Top-level
    { "K", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover Info" },
    
    { "<leader>d", group = "Diagnostics" },
    { "<leader>dt", "<cmd>lua toggle_diag_float()<cr>", desc = "Toggle Auto Float" },
    { "<leader>dh", "<cmd>lua vim.diagnostic.hide()<cr>", desc = "Hide Diagnostics" },
    { "<leader>dl", "<cmd>lua vim.diagnostic.open_float(nil, diag_float_opts)<cr>", desc = "Line Diagnostics" },
    
    { "g", group = "LSP/GoTo" },
    { "ga", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
    { "gd", "<cmd>lua goto_prev_diag()<cr>", desc = "Prev Diagnostic" },
    { "gn", "<cmd>lua goto_next_diag()<cr>", desc = "Next Diagnostic" },
    { "gD", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Definition" },
    { "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", desc = "Implementation" },
    { "gr", group = "References/Rename" },
    { "grr", "<cmd>lua vim.lsp.buf.references()<cr>", desc = "References" },
    { "grn", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },

    -- Leader mappings
    { "<leader>q", group = "Quick Actions" },
    { "<leader>qb", group = "Buffers" },
    { "<leader>ql", group = "LSP" },
    { "<leader>qs", group = "Search" },
    { "<leader>qt", group = "Treesitter" },
    { "<leader>qp", group = "Packer" },
})

-- Keep your custom window movement and tab mappings
local function map(mode, lhs, rhs)
    vim.api.nvim_set_keymap(mode, lhs, rhs, {noremap = true, silent = true})
end

map("n", "H", ":bp<CR>")
map("n", "L", ":bn<CR>")
map("n", "<tab>", ":tabnext<CR>")
map("n", "<S-tab>", ":tabprevious<CR>")
map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-k>", ":wincmd k<CR>")
map("n", "<C-l>", ":wincmd l<CR>")
