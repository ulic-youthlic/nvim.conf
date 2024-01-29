local M = {}

local config = function()
    require("scrollview").setup {
        excluded_filetypes = {[[neotree]]},
        current_only = true,
        base = [[right]],
        signs_on_startup = {[[all]]},
    }
end

M[1] = [[dstein64/nvim-scrollview]]
M.config = config
M.event = [[BufEnter]]

if vim.g.vscode then
    return {}
else
    return M
end
