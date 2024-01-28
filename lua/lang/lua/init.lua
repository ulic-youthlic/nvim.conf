local M = {}

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
local setup = function()
    require("lspconfig").lua_ls.setup(opt)
end
local lsp = "lua_ls"
local parser = { "lua" }

local dependencies = {
    require("lang.lua.neodev"),
}

M.setup = setup
M.dependencies = dependencies
M.lsp = lsp
M.parser = parser

return M
