-- add basic settings
require("base")

-- lazy.git
if vim.fn.executable('git') == 1 and vim.version().minor >= 8 then
    require("lazy-nvim")
    require("lazy").setup("plugins")
else
    vim.cmd([[
        echoerr 'NOT FOUND: git'
    ]])
end
