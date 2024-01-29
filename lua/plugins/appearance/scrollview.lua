local M = {}

local config = function()
    require("scrollview").setup {
        excluded_filetypes = { [[neotree]] },
        current_only = true,
        base = [[right]],
        signs_on_startup = { [[all]] },
    }
    vim.g.scrollview_diagnostics_error_symbol = "󰅚 "
    vim.g.scrollview_diagnostics_warn_symbol = "󰀪 "
    vim.g.scrollview_diagnostics_hint_symbol = "󰌶 "
    vim.g.scrollview_diagnostics_info_symbol = " "
end

M[1] = [[dstein64/nvim-scrollview]]
M.config = config
M.event = [[BufEnter]]

if vim.g.vscode then
    return {}
else
    return M
end
