local fn = require("fn")
local get_os = fn.get_os
local is_command = fn.is_command

--- @param vertically boolean
--- @return string
local get_split_cmd = function(vertically)
    local SP = "sp"
    if vertically then
        SP = "vsp"
    end
    return SP
end

--- @return string
local get_shell = function()
    if get_os() == "win" then
        if is_command("pwsh") then
            return [[pwsh]]
        elseif is_command("powershell") then
            return [[powershell]]
        else
            return [[cmd]]
        end
    else
        if is_command("fish") then
            return "fish"
        elseif is_command("zsh") then
            return "zsh"
        elseif is_command("bash") then
            return "bash"
        else
            return "sh"
        end
    end
end

--- @param vertically boolean
local function Term(vertically)
    local sp = get_split_cmd(vertically)
    local shell = get_shell()
    local terminal_buffer_number = vim.fn.bufnr("term://")
    local terminal_window_number = vim.fn.bufwinnr("term://")
    local window_count = vim.fn.winnr("$")

    if terminal_window_number > 0 and window_count > 1 then
        vim.fn.execute(terminal_window_number .. "wincmd c")
    elseif terminal_buffer_number > 0 and terminal_buffer_number ~= vim.fn.bufnr("%") then
        vim.fn.execute(sp .. " " .. terminal_buffer_number)
    elseif terminal_buffer_number == vim.fn.bufnr("%") then
        vim.fn.execute("bprevious | " .. sp .. " " .. terminal_buffer_number .. " | wincmd p")
    else
        vim.fn.execute(sp .. " term://" .. shell)
    end
end

vim.api.nvim_create_user_command("Term", function() Term(false) end, {
    desc = "Toggle terminal window",
})

vim.api.nvim_create_user_command("VTerm", function() Term(true) end, {
    desc = "Toggle terminal window vertically",
})

vim.keymap.set("n", "<m-t>", vim.cmd.Term, { noremap = true, silent = true, desc = [[Toggle  terminal]] })
vim.keymap.set("n", "<m-v>", vim.cmd.VTerm, { noremap = true, silent = true, desc = [[Toggle  terminal vertically]] })
vim.keymap.set("t", "<m-x>", "<C-\\><C-n>", { noremap = true, silent = true, desc = [[Detach terminal]] })
