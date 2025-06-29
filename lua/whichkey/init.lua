local which_key = {
    setup = {
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
        icons = {breadcrumb = "»", separator = "➜", group = "+"},
        win = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = {1, 0, 1, 0},
            padding = {2, 2, 2, 2}
        },
        layout = {
            height = {min = 4, max = 25},
            width = {min = 20, max = 50},
            spacing = 3
        },
        show_help = true
    },

    opts = {
        mode = "n",
        prefix = "<leader>q",
        silent = true,
        noremap = true,
        nowait = true
    },
    vopts = {
        mode = "v",
        prefix = "<leader>q",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true
    },
    -- NOTE: Prefer using : over <cmd> as the latter avoids going back in normal-mode.
    -- see https://neovim.io/doc/user/map.html#:map-cmd
    vmappings = {},
    mappings = {

        -- { "", "<leader>qc", desc = ":BufferClose!<CR>", nowait = true, remap = false },
        -- { "", "<leader>qst", desc = ":Telescope live_grep <cr>", nowait = true, remap = false },
        -- { "", "<leader>qsr", desc = ":Telescope oldfiles <cr>", nowait = true, remap = false },
        { "", group = "Diagnostics", nowait = true, remap = false },
        -- { "", "<leader>qtd", desc = "<cmd>TroubleToggle document_diagnostics<cr>", nowait = true, remap = false },
        -- { "", "<leader>qtl", desc = "<cmd>TroubleToggle loclist<cr>", nowait = true, remap = false },
        -- { "", "<leader>qsp", desc = ":lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>", nowait = true, remap = false },
        -- { "", "<leader>qsk", desc = ":Telescope keymaps <cr>", nowait = true, remap = false },
        -- { "", "<leader>qsn", desc = ":Telescope live_grep search_dirs={os.getenv('NOTES')} <cr>", nowait = true, remap = false },
        -- { "", "<leader>qsh", desc = ":Telescope help_tags <cr>", nowait = true, remap = false },
        -- { "", "<leader>qsj", desc = ":Telescope jumplist <cr>", nowait = true, remap = false },
        -- { "", "<leader>qsf", desc = ":Telescope find_files <cr>", nowait = true, remap = false },
        -- { "", "<leader>qtq", desc = "<cmd>TroubleToggle quickfix<cr>", nowait = true, remap = false },
        -- { "", "<leader>qtt", desc = "<cmd>TroubleToggle<cr>", nowait = true, remap = false },
        -- { "", "<leader>qbd", desc = ":bd<cr>", nowait = true, remap = false },
        -- { "", "<leader>qbf", desc = ":Telescope buffers <cr>", nowait = true, remap = false },
        -- { "", "<leader>qbl", desc = ":Telescope buffers<CR>", nowait = true, remap = false },
        -- { "", "<leader>qtr", desc = "<cmd>TroubleToggle lsp_references<cr>", nowait = true, remap = false },
        -- { "", "<leader>qbb", desc = ":b#<cr>", nowait = true, remap = false },
        -- { "", "<leader>qTi", desc = ":TSConfigInfo<cr>", nowait = true, remap = false },
        { "", group = "Buffers", nowait = true, remap = false },
        -- { "", "<leader>qtw", desc = "<cmd>TroubleToggle workspace_diagnostics<cr>", nowait = true, remap = false },
        { "", group = "Treesitter", nowait = true, remap = false },
        -- { "", "<leader>qbn", desc = ":bn<cr>", nowait = true, remap = false },
        -- { "", "<leader>qsc", desc = ":Telescope colorscheme <cr>", nowait = true, remap = false },
        -- { "", "<leader>qsR", desc = ":Telescope registers <cr>", nowait = true, remap = false },
        -- { "", "<leader>qla", desc = ":Telescope lsp_code_actions<cr>", nowait = true, remap = false },
        -- { "", "<leader>qlf", desc = ":lua vim.lsp.buf.formatting()<cr>", nowait = true, remap = false },
        -- { "", "<leader>qli", desc = ":LspInfo<cr>", nowait = true, remap = false },
        -- { "", "<leader>qlr", desc = ":lua vim.lsp.buf.rename()<cr>", nowait = true, remap = false },
        -- { "", "<leader>qlI", desc = ":LspInstallInfo<cr>", nowait = true, remap = false },
        -- { "", "<leader>qh", desc = ":nohlsearch<CR>", nowait = true, remap = false },
        { "", group = "LSP", nowait = true, remap = false },
        -- { "", "<leader>qe", desc = ":Telescope file_browser <CR>", nowait = true, remap = false },
        -- { "", "<leader>qf", desc = ":Telescope find_files <CR>", nowait = true, remap = false },
        -- { "", "<leader>qsb", desc = ":Telescope git_branches <cr>", nowait = true, remap = false },
        -- { "", "<leader>qlw", desc = ":Telescope diagnostics<cr>", nowait = true, remap = false },
        -- { "", "<leader>qpS", desc = ":PackerStatus<cr>", nowait = true, remap = false },
        { "", group = "Search", nowait = true, remap = false },
        -- { "", "<leader>qsC", desc = ":Telescope commands <cr>", nowait = true, remap = false },
        -- { "", "<leader>qsM", desc = ":Telescope man_pages <cr>", nowait = true, remap = false },
        { "", group = "Packer", nowait = true, remap = false },
        -- { "", "<leader>qpu", desc = ":PackerUpdate<cr>", nowait = true, remap = false },
        -- { "", "<leader>qpr", desc = ":lua require('lvim.utils').reload_lv_config()<cr>", nowait = true, remap = false },
        -- { "", "<leader>qps", desc = ":PackerSync<cr>", nowait = true, remap = false },
        -- { "", "<leader>qpc", desc = ":PackerCompile<cr>", nowait = true, remap = false },
        -- { "", "<leader>qpi", desc = ":PackerInstall<cr>", nowait = true, remap = false },
        -- { "", "<leader>qbp", desc = ":bp<cr>", nowait = true, remap = false },


    }
}

function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then options = vim.tbl_extend("force", options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map("n", "H", ":bp<CR>")
map("n", "L", ":bn<CR>")

map("n", "<tab>", ":tabnext<CR>")
map("n", "<S-tab>", ":tabprevious<CR>")

map("n", "<C-h>", ":wincmd h<CR>")
map("n", "<C-j>", ":wincmd j<CR>")
map("n", "<C-k>", ":wincmd k<CR>")
map("n", "<C-l>", ":wincmd l<CR>")

local wk = require("which-key")
wk.setup(which_key.setup)

local opts = which_key.opts
local vopts = which_key.vopts

local mappings = which_key.mappings
local vmappings = which_key.vmappings

wk.add(mappings, opts)
wk.add(vmappings, vopts)

if which_key.on_config_done then which_key.on_config_done(wk) end
