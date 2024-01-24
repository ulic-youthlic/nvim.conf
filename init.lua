-- add basic settings
require("basic")

-- lazy.git
if vim.fn.executable('git') == 1 then
	require("lazy-nvim")
	require("lazy").setup("plugins")
else
	vim.cmd([[
		echoerr 'NOT FOUND: git'
	]])
end
