-- npm i -g pyright
local util = require("lspconfig/util")
require'lspconfig'.pyright.setup {
    cmd = { DATA_PATH .. "/lsp_servers/python/node_modules/.bin/pyright-langserver", "--stdio" },
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    on_attach = require'lsp'.on_attach,
}
