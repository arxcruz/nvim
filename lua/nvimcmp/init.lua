-- Setup nvim-cmp.
local cmp = require'cmp'
local lspkind = require'lspkind'

cmp.setup({
    formatting = {
        format = lspkind.cmp_format({with_text = true, maxwidth = 50})
    },
    snippet = {
        expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    mapping = {
        ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = {
        { name = 'nvim_lsp' },

        -- For vsnip user.
        { name = 'vsnip' },
        -- Path
        { name = 'path' },

        -- Lua
        { name = 'nvim_lua' },
        -- For luasnip user.
        -- { name = 'luasnip' },

        -- For ultisnips user.
        -- { name = 'ultisnips' },

        { name = 'buffer' },
    }
})

