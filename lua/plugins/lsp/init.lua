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
    require [[plugins.lsp.neoconf]],
    require [[plugins.lsp.neodev]],
}
local config = function()
    lang.setup()
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
    vim.diagnostic.config({
        virtual_text = false,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
    })
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
