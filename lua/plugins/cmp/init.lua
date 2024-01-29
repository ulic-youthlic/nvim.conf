if vim.g.vscode then
    return {}
end
local M = {}

M[1] = [[hrsh7th/nvim-cmp]]
M.dependencies = {}
M.dependencies[1] = require [[plugins.cmp.cmp_type]]
local snip = require [[plugins.cmp.snip]]
M.dependencies[2] = snip.snip
local expend = snip.expend
local sources = {}
sources = snip.source

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
local config = function()
    local cmp = require [[cmp]]
    cmp.setup({
        snippet = {
            expend = expend
        },
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
            ["<c-b>"] = cmp.mapping.scroll_docs(-4),
            ["<c-f>"] = cmp.mapping.scroll_docs(4),
            ["<c-space>"] = cmp.mapping.complete(),
            ["<c-e>"] = cmp.mapping.abort(),
            ["<tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkey("<Plug>(vsnip-expand-or-jump)", "")
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { [[i]], [[s]] }),
            ["<s-tab>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkey("<Plug>(vsnip-jump-prev)", "")
                end
            end, { [[i]], [[s]] }),
        },
        sources = cmp.config.sources(sources, {
            name = 'buffer',
        })
    })
    cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
            { name = 'git' },
        }, {
            { name = 'buffer' },
        })
    })
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })
    cmp.setup.cmdline({ ':' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        })
    })
end
M.config = config
M.event = [[LspAttach]]
M.keys = {
    [[/]],
    [[?]],
    [[:]]
}

return M
