local M = {}
local is_command = require("fn").is_command
local setup = function()
end
local lsp = nil
local parser = {}
local ft = {}

if is_command("gcc") or is_command("clang") or is_command("cl") then
    setup = function()
        require("lspconfig").clangd.setup(require("coq").lsp_ensure_capabilities({}))
    end
    lsp = { "clangd" }
    parser = { "c", "cpp" }
    ft = {
        "c",
        "cpp",
    }
end


M.setup = setup
M.dependencies = {}
M.lsp = lsp
M.parser = parser
M.ft = ft

return M
