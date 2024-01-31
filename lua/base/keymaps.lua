require("base.terminal")

local mappings = {
    { mode = [[n]], from = [[;]], to = [[:]], opt = { desc = [[toggle to command mode]] } }
}

for _, mapping in ipairs(mappings) do
    vim.keymap.set(mapping.mode, mapping.from, mapping.to, mapping.opt)
end
