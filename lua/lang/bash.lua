if not require("fn").is_command("bash") then
    return {}
end
local M = {}

M.lsp = {
    "bashls",
}
M.dependencies = {}
M.parser = {
    "bash",
}
M.setup = function()
    ---@diagnostic disable-next-line: missing-fields
    require("lspconfig").bashls.setup({
        filetypes = {
            "bash",
            "sh"
        },
        single_file_support = true,
    })
end
M.ft = {
    "bash",
    "sh"
}

return M
