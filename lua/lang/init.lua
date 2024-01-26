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
for _, lang in pairs(langs) do
    vim.list_extend(dependencies, { require([[lang.]] .. lang).dependencies })
end

M.setup = setup
M.dependencies = dependencies

return M
