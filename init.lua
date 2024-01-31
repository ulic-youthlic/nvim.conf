-- add basic settings
require("base")

-- lazy.git
-- high version of neovim for inlay_hints
if require([[fn]]).is_command([[git]]) and vim.version().minor >= 10 then
    require("plugins")
    require("lazy").setup("plugins")
else
    vim.notify([[NOT FOUND: git]], vim.diagnotic.severity.ERROR)
end
