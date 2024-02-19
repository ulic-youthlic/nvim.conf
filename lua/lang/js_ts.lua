local M = {}

M.parser = {
    "javascript",
    "typescript"
}
M.lsp = {
    "tsserver"
}
M.ft = {
    "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"
}
M.dependencies = {
    {
        "pmizio/typescript-tools.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        opts = {},
    }
}
M.setup = function()
end

return M
