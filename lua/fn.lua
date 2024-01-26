local M = {}
local get_os = function()
    return package.config:sub(1, 1) == [[\\]] and "win" or "unix"
end
local is_command = function(command)
    if vim.fn.executable(command) == 1 then
        return true
    else
        return false
    end
end

M.get_os = get_os
M.is_command = is_command

return M
