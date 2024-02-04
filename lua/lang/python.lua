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
        [[jedi_language_server]]
    }
    setup = function()
        require("lspconfig").jedi_language_server.setup {}
    end
end

M.parser = parser
M.lsp = lsp
M.setup = setup
M.dependencies = dependencies

return M
