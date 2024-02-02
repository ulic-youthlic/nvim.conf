if vim.g.vscode then
    return {}
end

local M = {}

M[1] = [[ms-jpq/coq_nvim]]
M.branch = "coq"
M.dependencies = {
    {
        [[ms-jpq/coq.artifacts]],
        branch = "artifacts",
    },
}
M.event = [[InsertEnter]]

return M
