local M = {}

M[1] = [[j-hui/fidget.nvim]]
M.tag = "v1.0.0"
M.config = function()
    require("fidget").setup()
end

if vim.version().minor >= 8 then
    return M
else
    return {}
end
