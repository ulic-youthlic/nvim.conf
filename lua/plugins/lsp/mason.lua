local M = {}

M[1] = "williamboman/mason.nvim"
M.config = function()
    require("mason").setup({
        Path = [[append]]
    })
end
M.cmd = [[Mason]]

return M
