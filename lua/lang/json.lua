local M = {}

M.setup = function()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("lspconfig").jsonls.setup({
        capabilities = capabilities,
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
    })
end
M.lsp = "jsonls"
M.parser = { [[json]], [[jsonc]] }
M.dependencies = {
    [[b0o/SchemaStore.nvim]],
}

return M
