if vim.g.vscode then
    return {}
end
local M = {}
M[1] = "nvim-neo-tree/neo-tree.nvim"
M.branch = "v3.x"
M.dependencies = {
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
}
M.keys = {
    {
        [[<m-n>]],
        function()
            vim.cmd [[Neotree toggle]]
        end,
        mode = { [[n]], [[i]], [[v]] },
        desc = [[Toggle Neotree]]
    }
}

return M
