local M = {}

local show_line_diagnostics = function()
    vim.o.updatetime = 250
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
end
M.keys = {
    {
        "]e",
        function()
            require("lspsaga.diagnostic"):goto_next()
        end,
        mode = { [[v]], [[n]] },
        desc = [[Goto next diagnostic]]
    },
    {
        "[e",
        function()
            require("lspsaga.diagnostic"):goto_prev()
        end,
        mode = { [[v]], [[n]] },
        desc = [[Goto prev diagnostic]]
    },
    {
        "K",
        "<cmd>Lspsaga hover_doc +unfocus<cr>",
        mode = [[n]],
        desc = [[Show hover doc]]
    }
}

return M
