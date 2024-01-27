local M = {}
local is_command = require("fn").is_command
local langs = {
}

-- neovim configuration written on lua
if is_command("lua") or is_command("luajit") or is_command("nvim") then
    vim.list_extend(langs, { "lua" })
end
if is_command("rustc") then
    vim.list_extend(langs, { "rust" })
end
if is_command("gcc") or is_command("clang") or is_command("cl") then
    vim.list_extend(langs, { "c_cxx" })
end

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
