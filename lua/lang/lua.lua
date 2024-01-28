local M = {}

local setup = function()
    local opt = {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace"
                },
            },
        },
    }
    require("lspconfig").lua_ls.setup(opt)
end
local lsp = "lua_ls"
local parser = { "lua" }

M.setup = setup
M.lsp = lsp
M.parser = parser
M.dependencies = {}

return M
