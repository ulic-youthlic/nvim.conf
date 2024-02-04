local M = {}
local is_command = require("fn").is_command
local dependencies = {}
local lsp = nil
local setup = function()
end
local parser = {}
local ft = {}

if is_command("rustc") then
    setup = function()
        require("lspconfig").rust_analyzer.setup(require("coq").lsp_ensure_capabilities({}))
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
    lsp = { "rust_analyzer" }
    parser = { "rust" }
    ft = {
        "rust"
    }
end

M.setup = setup
M.dependencies = dependencies
M.lsp = lsp
M.parser = parser
M.ft = ft

return M
