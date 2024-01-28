local M = {}
local is_command = require("fn").is_command
local setup = function()
end
local lsp = nil
local parser = {}

if is_command("gcc") or is_command("clang") or is_command("cl") then
    setup = function()
        require("lspconfig").clangd.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    end
    lsp = "clangd"
    parser = { "c", "cpp" }
end


M.setup = setup
M.dependencies = {}
M.lsp = lsp
M.parser = parser

return M
