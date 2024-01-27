local M = {}

M[1] = "williamboman/mason.nvim"
M.config = function()
    require("mason").setup()
end
M.cmd = [[Mason]]

return M
