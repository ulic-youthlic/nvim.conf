local M = {}

local show_line_diagnostics = function()
    vim.o.updatetime = 500
    vim.api.nvim_create_autocmd({ 'CursorHold' }, {
        group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
        callback = function()
            vim.cmd [[Lspsaga show_cursor_diagnostics ++unfocus]]
        end
    })
    vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
        group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
        callback = function()
            vim.cmd [[Lspsaga show_line_diagnostics ++unfocus]]
        end
    })
end

local auto_cmd = function()
    show_line_diagnostics()
end

M[1] = 'nvimdev/lspsaga.nvim'
local keymap = function()
    require("which-key").register({
        ["]"] = {
            e = {
                function()
                    require("lspsaga.diagnostic"):goto_next()
                end,
                [[Goto next diagnostic]],
                mode = {
                    "n",
                    "v"
                }
            }
        },
        ["["] = {
            e = {
                function()
                    require("lspsaga.diagnostic"):goto_prev()
                end,
                [[Goto prev diagnostic]],
                mode = { [[v]], [[n]] },
            }
        },
        K = {
            "<cmd>Lspsaga hover_doc +unfocus<cr>",
            [[Show hover doc]]
        },
    })
end
M.config = function()
    require('lspsaga').setup {
        diagnostic = {
            show_code_action = true,
            jump_num_shortcut = true,
            max_width = 0.8,
            max_height = 0.6,
            text_hl_follow = true,
            border_follow = true,
            extend_relatedInformation = true,
            show_layout = "float",
            show_normal_height = 10,
            max_show_width = 0.9,
            max_show_height = 0.6,
            diagnostic_only_current = false,
        },
    }
    auto_cmd()
    keymap()
end

return M
