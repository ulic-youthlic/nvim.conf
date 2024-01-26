local M = {}

M[1] = 'nvimdev/lspsaga.nvim'
M.config = function()
    require('lspsaga').setup {}
end

return M
