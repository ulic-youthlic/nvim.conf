local M = {}
local lang = require("lang")
local ft = lang.parser
local dependencies = lang.dependencies

local lsp = {}
lsp[1] = "neovim/nvim-lspconfig"
lsp.dependencies = {
    require [[plugins.lsp.mason]],
    require [[plugins.lsp.mason-lspconfig]],
    require [[plugins.lsp.lspsaga]],
    require [[plugins.lsp.neoconf]],
}
local config = function()
    lang.setup()
end
lsp.config = config
lsp.ft = ft

M[1] = lsp
vim.list_extend(M, dependencies)

return M
