if vim.g.vscode then
    return {}
end

local M = {}
local auto_cmd = function()
    vim.api.nvim_create_autocmd("InsertEnter", {
        pattern = "*",
        callback = function()
            vim.cmd [[COQnow]]
        end,
        once = true
    })
end
local config = function()
    auto_cmd()
end

M[1] = [[ms-jpq/coq_nvim]]
M.branch = "coq"
M.dependencies = {
    {
        [[ms-jpq/coq.artifacts]],
        branch = "artifacts",
    },
}
M.event = [[InsertEnter]]
M.config = config

return M
