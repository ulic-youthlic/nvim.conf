local M = {}

M[1] = "lukas-reineke/indent-blankline.nvim"
M.config = function()
    require("ibl").setup {}
    require("ibl.config").config.scope.enabled = true
end
M.event = [[BufAdd]]

return M
