local M = {}
local ensure = require [[lang]].parser

M[1] = [[nvim-treesitter/nvim-treesitter]]
M.config = function()
    require [[nvim-treesitter]].setup {}
    require [[nvim-treesitter.configs]].setup {
        ensure_installed = ensure,
        auto_install = false,
        highlight = {
            enable = true,
        },
    }
end

return M
