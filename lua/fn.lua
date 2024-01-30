local M = {}
local get_os = function()
    local sysname = vim.loop.os_uname().sysname
    if sysname == "Windows_NT" then
        return "win"
    elseif sysname == "Linux" then
        return "linux"
    else
        return "mac"
    end
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
