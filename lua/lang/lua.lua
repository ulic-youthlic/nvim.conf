local M = {}

local setup = function()
    local opt = {
        before_init = require("neodev.lsp").before_init,
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
    local coq = require("coq")
    require("lspconfig").lua_ls.setup(coq.lsp_ensure_capabilities(opt))
end
local lsp = {
    "lua_ls"
}
local parser = { "lua" }
local ft = { "lua" }

M.setup = setup
M.lsp = lsp
M.parser = parser
M.dependencies = {}
M.ft = ft

return M
