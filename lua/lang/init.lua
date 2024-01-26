local M = {}
local langs = {
    "lua",
    "rust"
}

local setup = function()
    for _, lang in pairs(langs) do
        require([[lang.]] .. lang).setup()
    end
end
local dependencies = {}
local lsp = {}
for _, lang in pairs(langs) do
    vim.list_extend(dependencies, { require([[lang.]] .. lang).dependencies })
    vim.list_extend(lsp, { require([[lang.]] .. lang).lsp })
end

M.setup = setup
M.dependencies = dependencies
M.lsp = lsp

return M
