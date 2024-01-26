local M = {}
local ensure = require("lang").lsp

M[1] = "williamboman/mason-lspconfig.nvim"
M.config = function()
    require("mason-lspconfig").setup({
        ensure_installed = ensure
    })
end

return M
