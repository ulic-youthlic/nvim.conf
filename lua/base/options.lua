local option = vim.opt
local buffer = vim.b
local global = vim.g

------

local get_os = require("fn").get_os
local undo_dir = vim.fn.stdpath('data') .. [[/undo]]
local term_gui_color = false
if get_os() == "win" then
    term_gui_color = true
elseif os.getenv([[TERM]]) == 'xterm-256color' then
    term_gui_color = true
end

------

global.mapleader = [[,]]
---@diagnostic disable-next-line: inject-field
buffer.fileencoding = "utf-8"
option.backspace = { "indent", "eol", "start" }
option.tabstop = 4
option.shiftwidth = 4
option.expandtab = true
option.shiftround = true
option.autoindent = true
option.smartindent = true
option.nu = true
option.rnu = true
option.wildmenu = true
option.hlsearch = false
option.ignorecase = true
option.smartcase = true
option.completeopt = { "menu", "noselect" }
option.cursorline = true
option.termguicolors = term_gui_color
option.signcolumn = "yes"
option.autoread = true
option.title = true
option.swapfile = false
option.backup = false
option.updatetime = 50
option.mouse = "a"
option.undofile = true
---@diagnostic disable-next-line: assign-type-mismatch
option.undodir = vim.fn.expand(undo_dir)
option.exrc = true
option.scrolloff = 5
option.wrap = false
option.splitright = true
option.splitbelow = true
vim.api.nvim_create_autocmd(
    [[TextYankPost]],
    {
        pattern = [[*]],
        callback = function()
            vim.highlight.on_yank({
                timeout = 500,
                on_macro = true,
                on_visual = true
            })
        end,
    }
)
if vim.g.vscode then
    local vscode = require("vscode-neovim")
    vim.notify = vscode.notify
    vim.cmd [[let g:clipcoard = g:vscode_clipboard]]
end
