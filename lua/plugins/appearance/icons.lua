local M = {}

M[1] = 'nvim-tree/nvim-web-devicons'
M.config = function()
    require 'nvim-web-devicons'.setup {}
end
M.event = "BufEnter"

return M
