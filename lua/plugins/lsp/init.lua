local M = {}
local dependencies = {}
local lang = require("lang")

M[1] = "neovim/nvim-lspconfig"
vim.list_extend(dependencies, {
    require [[plugins.lsp.mason]],
    require [[plugins.lsp.mason-lspconfig]],
    require [[plugins.lsp.lspsaga]]
})
vim.list_extend(dependencies, lang.dependencies)

local config = function()
    lang.setup()
end

M.config = config
M.dependencies = dependencies

return M
