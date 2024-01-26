local M = {}
local opt = {}
M[1] = "williamboman/mason.nvim"
M.config = function()
    require("mason").setup(opt)
end
return M
