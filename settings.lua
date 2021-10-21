--[[
O is the global options object
Formatters and linters should be
filled in as strings with either
a global executable or a path to
an executable
]]

-- general
O.auto_complete = true
O.auto_close_tree = 0
O.wrap_lines = false
O.document_highlight = false
-- python
-- add things like O.python.formatter.yapf.exec_path
-- add things like O.python.linter.flake8.exec_path
-- add things like O.python.formatter.isort.exec_path
O.python.formatter = 'yapf'
-- O.python.linter = 'flake8'
O.python.isort = true
O.python.autoformat = true
O.python.diagnostics.virtual_text = true
O.python.diagnostics.signs = true
O.python.diagnostics.underline = true

-- json
O.json.autoformat = true
