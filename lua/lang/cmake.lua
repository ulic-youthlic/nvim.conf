local is_command = require("fn").is_command
local M = {}

M.lsp = {}
M.parser = {}
M.ft = {}
M.setup = function()
end
M.dependencies = {}

if is_command("cmake") then
    M.lsp = { "cmake" }
    M.ft = { "cmake" }
    M.parser = { "cmake" }
    M.setup = function()
        require("lspconfig").cmake.setup(require("coq").lsp_ensure_capabilities {})
    end
end

return M
