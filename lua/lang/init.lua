local M = {}
local langs = {
    "lua",
    "rust",
    "c_cxx",
    "json",
    "python",
    "bash",
    "cmake",
    "yaml",
    "toml",
    "js_ts",
}

local setup = function()
    for _, lang in pairs(langs) do
        require([[lang.]] .. lang).setup()
    end
end
local dependencies = {}
local lsp = {}
local parser = {}
local ft = {}
for _, lang in pairs(langs) do
    vim.list_extend(dependencies, require([[lang.]] .. lang).dependencies)
    vim.list_extend(lsp, require([[lang.]] .. lang).lsp)
    vim.list_extend(parser, require([[lang.]] .. lang).parser)
    vim.list_extend(ft, require([[lang.]] .. lang).ft)
end

M.setup = setup
M.dependencies = dependencies
M.lsp = lsp
M.parser = parser
M.ft = ft

return M
