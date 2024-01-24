vim.cmd([[
	au TextYankPost * silent! lua vim.highlight.on_yank({timeout=100, on_macro=true, on_visual=true})
]])
