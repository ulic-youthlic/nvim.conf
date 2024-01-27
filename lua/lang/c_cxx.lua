local M = {}

local setup = function()
        require("lspconfig").clangd.setup {}
    end
local lsp = "clangd"
local parser = { "c", "cpp" }


M.setup = setup
M.dependencies = {}
M.lsp = lsp
M.parser = parser

return M
