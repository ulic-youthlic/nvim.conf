local M = {}

M.setup = function()
    require("lspconfig").jsonls.setup(require("coq").lsp_ensure_capabilities({
        settings = {
            json = {
                format = {
                    enable = true,
                },
                schemas = require('schemastore').json.schemas(),
                validate = {
                    enable = true,
                }
            }
        }
    }))
end
M.lsp = { "jsonls" }
M.parser = { [[json]], [[jsonc]] }
M.ft = { [[json]], [[jsonc]] }
M.dependencies = {
    [[b0o/SchemaStore.nvim]],
}

return M
