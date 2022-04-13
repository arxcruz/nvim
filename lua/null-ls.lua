-- npm i -g pyright
local null_ls = require("null-ls")
local h = require("null-ls.helpers")
local sources = {
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.autopep8.with({
        command = "autopep8-3",
        extra_args = { "--aggressive", "--aggressive" },
    }),
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.isort,
    null_ls.builtins.diagnostics.flake8,
    -- null_ls.builtins.diagnostics.pylint.with({
    --     command = "pylint-3",
    -- }),
}

null_ls.setup({sources = sources, debug = true, })
