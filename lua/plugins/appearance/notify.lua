local M = {}
local opt = {
    render = "compact",
    stages = "slide",
    max_width = function()
        local width = vim.api.nvim_win_get_width(0)
        return width / 5
    end,
    timeout = 250
}

M[1] = 'rcarriga/nvim-notify'
M.config = function()
    local notify = require("notify")
    notify.setup(opt)
    vim.notify = notify
end
M.event = [[VeryLazy]]

return M
