local M = {}

M.dependencies = {}
M.lsp = {
    "yamlls"
}
M.parser = {
    "yaml"
}
M.ft = {
    "yaml",
    "yaml.docker-compose"
}
M.setup = function()
    require('lspconfig').yamlls.setup(require("coq").lsp_ensure_capabilities {
        settings = {
            yaml = {
                schemas = {
                    ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                    ["../path/relative/to/file.yml"] = "/.github/workflows/*",
                    ["/path/from/root/of/project"] = "/.github/workflows/*",
                },
            },
        }
    })
end

return M
