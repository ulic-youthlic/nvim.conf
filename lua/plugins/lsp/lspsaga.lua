local M = {}

local show_line_diagnostics = function()
    vim.o.updatetime = 250
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
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
    require('lspsaga').setup {}
    auto_cmd()
end

return M
