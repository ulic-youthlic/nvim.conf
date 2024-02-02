if vim.g.vscode then
    return {}
end
local M = {}
M.opts = {
    window = {
        border = "single"
    }
}

M[1] = [[folke/which-key.nvim]]
M.event = [[VeryLazy]]
M.init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
end

return M
