local M = {}

local setup = function()
    local opt = {
        before_init = require("neodev.lsp").before_init,
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace"
                },
                hint = {
                    enable = true
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
