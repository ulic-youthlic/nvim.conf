local M = {}

M[1] = 'echasnovski/mini.cursorword'
M.version = '*'
M.config = function()
    require([[mini.cursorword]]).setup()
end

return M
