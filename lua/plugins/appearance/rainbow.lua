local M = {}

M[1] = "HiPhish/rainbow-delimiters.nvim"
M.url = [[https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git]]
M.config = function()
    require [[rainbow-delimiters.setup]].setup()
end

return M
