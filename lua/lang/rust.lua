local M = {}
local is_command = require("fn").is_command
local dependencies = {}
local lsp = nil
local setup = function()
end

if is_command("rustc") then
    setup = function()
        require("lspconfig").rust_analyzer.setup {}
    end
    dependencies = {
        {
            'vxpm/ferris.nvim',
            config = function()
                require("ferris").setup {}
            end
        } 
    }
    lsp = "rust_analyzer"
end

M.setup = setup
M.dependencies = dependencies
M.lsp = lsp

return M
