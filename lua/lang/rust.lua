local M = {}
local is_command = require("fn").is_command
local dependencies = {}
local lsp = nil

if is_command("rustc") then
    dependencies = {
        {
            'mrcjkb/rustaceanvim',
            version = '^4', -- Recommended
            ft = { 'rust' },
        }
    }
    lsp = "rust_analyzer"
end

M.setup = function()
end
M.dependencies = dependencies
M.lsp = lsp

return M
