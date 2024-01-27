local M = {}
local is_command = require("fn").is_command

M.dependencies = {
    "nvim-lua/plenary.nvim",
}

local fzf_native = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
}
if not is_command("cmake") then
    fzf_native.build = "make"
end
local load = function()
end
local opt = {}
if is_command("cmake") or is_command("make") then
    M.dependencies[2] = fzf_native
    opt.extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
    load = function()
        require("telescope").load_extension('fzf')
    end
end

M[1] = [[nvim-telescope/telescope.nvim]]
M.branch = [[0.1.x]]
M.config = function()
    require("telescope").setup(opt)
    load()
end
M.event = [[VeryLazy]]

return M
