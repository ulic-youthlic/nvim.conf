-- add basic settings
require("base")

-- lazy.git
if require([[fn]]).is_command([[git]]) and vim.version().minor >= 8 then
    require("lazy-nvim")
    require("lazy").setup("plugins")
else
    vim.api.nvim_err_writeln([[NOT FOUND: git]])
end
