local M = {}
local is_command = require("fn").is_command

local setup = function()
    if is_command("lua") or is_command("luajit") then
        require("lspconfig").lua_ls.setup {}
    end
end

M.setup = setup
M.dependencies = {}
M.lsp = "lua_ls"

return M
