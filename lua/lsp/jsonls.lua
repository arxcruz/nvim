require"lspconfig".jsonls.setup {
    cmd = { DATA_PATH .. '/lsp_servers/vscode-langservers-extracted/node_modules/.bin/vscode-json-language-server', '--stdio' },

    -- Set the schema so that it can be completed in settings json file.
    -- The schemas defined in `jsonls.json` will be merged with the list configured here.
    settings = {
        json = {
        schemas = require'nlspsettings.jsonls'.get_default_schemas()
        }
    }
}
