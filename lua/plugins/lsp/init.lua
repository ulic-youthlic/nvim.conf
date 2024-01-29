local M = {}
local lang = require("lang")
local ft = lang.parser
local dependencies = lang.dependencies

local lsp = {}
lsp[1] = "neovim/nvim-lspconfig"
lsp.dependencies = {
    require [[plugins.lsp.mason]],
    require [[plugins.lsp.mason-lspconfig]],
    require [[plugins.lsp.lspsaga]],
    require [[plugins.lsp.fidget]],
}

local config = function()
    lang.setup()
    vim.diagnostic.config {
        virtual_text = false,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "",
                [vim.diagnostic.severity.INFO] = "",
            },
            numhl = {
                [vim.diagnostic.severity.ERROR] = "DiagnosticError",
                [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
                [vim.diagnostic.severity.HINT] = "DiagnosticHint",
                [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
            },
            linehl = {
                [vim.diagnostic.severity.ERROR] = "",
                [vim.diagnostic.severity.WARN] = "",
                [vim.diagnostic.severity.HINT] = "",
                [vim.diagnostic.severity.INFO] = "",
            },
            severity_sort = true,
        },
        underline = true,
        update_in_insert = false,
    }
end
lsp.config = config
lsp.ft = ft

M[1] = lsp
vim.list_extend(M, dependencies)

if vim.g.vscode then
    return {}
else
    return M
end
