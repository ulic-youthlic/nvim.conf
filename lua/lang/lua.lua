local M = {}
local is_command = require("fn").is_command

local setup = function()
end
local lsp = nil
local parser = {}

if is_command("lua") or is_command("luajit") then
    setup = function()
        require("lspconfig").lua_ls.setup {}
    end
    lsp = "lua_ls"
    parser = { "lua" }
end

M.setup = setup
M.dependencies = {}
M.lsp = lsp 
M.parser = parser

return M
