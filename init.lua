-- add basic settings
require("base")

-- lazy.git
if require([[fn]]).is_command([[git]]) and vim.version().minor >= 8 then
    require("plugins")
    require("lazy").setup("plugins")
else
    vim.notify([[NOT FOUND: git]], vim.diagnotic.severity.ERROR)
end
