local M = {}
local opt = {
    render = "wrapped-compact",
    stages = "slide",
    max_width = function()
        return math.ceil(vim.go.co / 4)
    end,
    timeout = 300
}

M[1] = 'rcarriga/nvim-notify'
M.config = function()
    local notify = require("notify")
    notify.setup(opt)
    vim.notify = notify
    require("which-key").register(
        {
            n = {
                function()
                    vim.cmd [[Telescope notify]]
                end,
                [[Show all notifications]]
            }
        }, {
            prefix = "<leader>"
        }
    )
end
M.event = [[VeryLazy]]

return M
