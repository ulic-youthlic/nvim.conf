local M = {}

M.parser = {
    "toml"
}
M.ft = {
    "toml"
}
M.lsp = {
    "taplo"
}
M.dependencies = {}
M.setup = function()
    require 'lspconfig'.taplo.setup(
        require("coq").lsp_ensure_capabilities {
        }
    )
end

return M
