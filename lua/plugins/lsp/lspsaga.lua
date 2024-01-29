local M = {}

vim.o.updatetime = 250
local auto_show_line_diagnostics =  function()
    vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
        group = vim.api.nvim_create_augroup("float_diagnostic", {clear = true}),
        callback = function()
            vim.cmd [[Lspsaga show_line_diagnostics ++unfocus]]
        end
    })
end

M[1] = 'nvimdev/lspsaga.nvim'
M.config = function()
    require('lspsaga').setup {}
    auto_show_line_diagnostics()
end

return M
