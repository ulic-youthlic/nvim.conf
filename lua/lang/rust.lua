local M = {}

local setup = function()
    require("lspconfig").rust_analyzer.setup {}
end
local dependencies = {
    {
        'vxpm/ferris.nvim',
        config = function()
            require("ferris").setup {}
        end,
        ft = [[rust]]
    }
}
local lsp = "rust_analyzer"
local parser = { "rust" }

M.setup = setup
M.dependencies = dependencies
M.lsp = lsp
M.parser = parser

return M
