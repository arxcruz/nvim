local null_ls = require('null-ls')

local sources = {
    require("none-ls.diagnostics.flake8"),
    null_ls.builtins.formatting.black.with({
       extra_args = { "--line-length=80", "--preview" },
       command = 'black',
    }),
    -- null_ls.builtins.formatting.isort,
    -- null_ls.builtins.diagnostics.flake8,
    -- null_ls.builtins.diagnostics.pylint.with({
    --     command = "pylint-3",
    -- }),
}

null_ls.setup({
    sources = sources,
    debug = true,
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end
})
