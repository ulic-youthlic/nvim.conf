local M = {}
local is_command = require("fn").is_command
local setup = function()
end
local lsp = nil

if is_command("gcc") or is_command("clang") or is_command("cl") then
    setup = function()
        require("lspconfig").clangd.setup {}
    end
    lsp = "clangd"
end


M.setup = setup
M.dependencies = {}
M.lsp = lsp

return M
