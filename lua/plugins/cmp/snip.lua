local M = {}

M.snip = {}
M.snip[1] = {
    [[hrsh7th/cmp-vsnip]],
    dependencies = [[hrsh7th/vim-vsnip]]
}

M.source = {
    --- for lsp cmp
    { name = 'nvim_lsp' },
    { name = 'vsnip' },   -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
}
M.expend = function(args)
    vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
    -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
end

return M
