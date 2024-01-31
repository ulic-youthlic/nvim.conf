local M = {}
local is_command = require("fn").is_command
local dependencies = {}
local lsp = nil
local setup = function()
end
local parser = {}

if is_command("rustc") then
    setup = function()
        require("lspconfig").rust_analyzer.setup {
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
        }
    end
    dependencies = {
        {
            'vxpm/ferris.nvim',
            config = function()
                require("ferris").setup {}
            end,
            ft = [[rust]]
        }
    }
    lsp = "rust_analyzer"
    parser = { "rust" }
end

M.setup = setup
M.dependencies = dependencies
M.lsp = lsp
M.parser = parser

return M
