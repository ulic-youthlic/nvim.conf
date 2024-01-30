local M = {}

M[1] = "nvim-lualine/lualine.nvim"
M.config = function()
    vim.opt.showmode = false
    require("lualine").setup({ theme = "material" })
end

return M
