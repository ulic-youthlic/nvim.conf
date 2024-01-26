local M = {}
local is_command = require("fn").is_command
local dependencies = {}

if is_command("rustc") then
    dependencies = {
        'mrcjkb/rustaceanvim',
        version = '^4', -- Recommended
        ft = { 'rust' },
    }
end

M.setup = function()
end
M.dependencies = dependencies
M.lsp = "rust_analyzer"

return M
