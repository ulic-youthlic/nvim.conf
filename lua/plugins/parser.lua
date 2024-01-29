local M = {}
local parsers = require [[lang]].parser
vim.list_extend(parsers, {
    --- for lsp hover
    "markdown",
    "markdown_inline",
    --- for vim help doc
    "vim",
    "vimdoc"
})

M[1] = [[nvim-treesitter/nvim-treesitter]]
M.config = function()
    require [[nvim-treesitter]].setup {}
    require [[nvim-treesitter.configs]].setup {
        ensure_installed = parsers,
        auto_install = false,
        highlight = {
            enable = true,
        },
    }
end
M.ft = parsers
M.cmd = [[TSInstallInfo]]

if vim.g.vscode then
    return {}
else
    return M
end
