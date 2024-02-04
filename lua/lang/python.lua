local M = {}

local is_command = require("fn").is_command
local dependencies = {}
local lsp = {}
local setup = function()
end
local parser = {}

if is_command("python") then
    parser = {
        "python"
    }
    lsp = {
        [[pylsp]]
    }
    setup = function()
        require("lspconfig").pylsp.setup {}
    end
end

M.parser = parser
M.lsp = lsp
M.setup = setup
M.dependencies = dependencies

return M
