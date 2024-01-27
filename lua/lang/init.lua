local M = {}
local langs = {
    "lua",
    "rust",
    "c_cxx"
}

local setup = function()
    for _, lang in pairs(langs) do
        require([[lang.]] .. lang).setup()
    end
end
local dependencies = {}
local lsp = {}
local parser = {}
for _, lang in pairs(langs) do
    vim.list_extend(dependencies, require([[lang.]] .. lang).dependencies)
    vim.list_extend(lsp, { require([[lang.]] .. lang).lsp })
    vim.list_extend(parser, require([[lang.]] .. lang).parser)
end

M.setup = setup
M.dependencies = dependencies
M.lsp = lsp
M.parser = parser

return M
