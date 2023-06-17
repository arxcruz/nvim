local cmp = require('cmp')
local lsp_status = require('lsp-status')
local luasnip = require('luasnip')

local win = require('lspconfig.ui.windows')
local _default_opts = win.default_opts

win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = 'rounded'
    return opts
end

local signs = {
    active = true,
    values = {
        {name = 'DiagnosticSignError', text = ''},
        {name = 'DiagnosticSignWarn', text = ''},
        {name = 'DiagnosticSignHint', text = ''},
        {name = 'DiagnosticSignInfo', text = ''}
    }
}

for _, sign in ipairs(signs.values) do
    vim.fn.sign_define(sign.name, {
        texthl = sign.name,
        text = sign.text,
        numhl = sign.name
    })
end

local kind_icons = {
    Text = '',
    Method = 'm',
    Function = '',
    Constructor = '',
    Field = '',
    Variable = '',
    Class = '',
    Interface = '',
    Module = '',
    Property = '',
    Unit = '',
    Value = '',
    Enum = '',
    Keyword = '',
    Snippet = '',
    Color = '',
    File = '',
    Reference = '',
    Folder = '',
    EnumMember = '',
    Constant = '',
    Struct = '',
    Event = '',
    Operator = '',
    TypeParameter = ''
}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and
               vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col,
                                                                          col)
                   :match('%s') == nil
end

-- completion setup
cmp.setup({
    snippet = {
        expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
            -- vim.fn["UltiSnips#Anon"](args.body)
        end
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({select = false}),
        -- ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'}),
        -- ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'})
    },
    formatting = {
        fields = {'kind', 'abbr', 'menu'},
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            vim_item.menu = ({
                copilot = '[Copilot]',
                luasnip = 'LuaSnip',
                nvim_lua = '[NVim Lua]',
                nvim_lsp = '[LSP]',
                buffer = '[Buffer]',
                path = '[Path]'
            })[entry.source.name]
            return vim_item
        end
    },
    sources = {
        {name = 'nvim_lsp'}, {name = 'luasnip'}, -- { name = "ultisnips" },
        -- { name = "vsnip" },
        {name = 'buffer'}, {name = 'path'}
    },
    confirm_opts = {behavior = cmp.ConfirmBehavior.Replace, select = false}
})

-- helper function for mappings
local m = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, '<cmd> ' .. result .. '<cr>',
                                {noremap = true, silent = true})
end

-- function to attach completion when setting up lsp
local on_attach = function(client)
    if client.name == 'sumneko_lua' then
        client.server_capabilities.document_formatting = false
    end
    lsp_status.register_progress()
    lsp_status.on_attach(client)

    -- Mappings.
    m('n', 'ga', 'lua vim.lsp.buf.code_action()')
    m('n', 'gD', 'lua vim.lsp.buf.declaration()')
    m('n', 'gd', 'lua vim.lsp.buf.definition()')
    m('n', 'ge', 'lua vim.diagnostic.goto_next()')
    m('n', 'gE', 'lua vim.diagnostic.goto_prev()')
    m('n', 'gi', 'lua vim.lsp.buf.implementation()')
    m('n', 'gr', 'lua vim.lsp.buf.references()')
    m('n', 'K', 'lua vim.lsp.buf.hover()')
    -- m("n", "<space>rn", "lua vim.lsp.buf.rename()")
    m('n', '<space>l', 'lua vim.diagnostic.open_float()')
    m('n', '<space>f', 'lua vim.lsp.buf.formatting()')
    m('v', '<space>f', 'lua vim.lsp.buf.range_formatting()')
    m('n', '<space>q', 'lua vim.diagnostic.setloclist()')
end

-- setup lsp installer
local lsp_installer = require('nvim-lsp-installer')

-- Provide settings first!
lsp_installer.settings({
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗'
        }
    }
})

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = on_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
                                                                       .protocol
                                                                       .make_client_capabilities()),
        flags = {debounce_text_changes = 150}
    }
    server:setup(opts)
end)

-- lsp settings
require('nlspsettings').setup()

-- diagnostics
vim.diagnostic.config({
    virtual_text = false,
    underline = true,
    float = {source = 'always'},
    severity_sort = true,
    --[[ virtual_text = {
      prefix = "»",
      spacing = 4,
    }, ]]
    signs = true,
    update_in_insert = false
})
