local opt = vim.opt

opt.nu = true
opt.relativenumber = true

vim.cmd([[
	au TextYankPost * silent! lua vim.highlight.on_yank({timeout=100, on_macro=true, on_visual=true})
]])
