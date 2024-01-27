local M = {}

local setup = function()
    require("lspconfig").lua_ls.setup {}
end
local lsp = "lua_ls"
local parser = { "lua" }

M.setup = setup
M.dependencies = {}
M.lsp = lsp
M.parser = parser

return M
