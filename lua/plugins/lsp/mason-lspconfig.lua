local M = {}

M[1] = "williamboman/mason-lspconfig.nvim"
M.config = function()
    require("mason-lspconfig").setup()
end

return M
