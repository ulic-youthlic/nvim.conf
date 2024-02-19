local M = {}

M.parser = {
    "html"
}
M.lsp = {
    "html"
}
M.dependencies = {}
M.ft = {
    "html"
}
M.setup = function()
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require("lspconfig").html.setup(require("coq").lsp_ensure_capabilities {
        capabilities = capabilities,
    })
end

return M
