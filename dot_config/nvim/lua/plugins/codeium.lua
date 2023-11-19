return {
    'Exafunction/codeium.vim',
    config = function()
        vim.keymap.set('i', '<M-k>', function() return vim.fn['codeium#Accept']() end, { expr = true })
        vim.keymap.set('i', '<M-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
        vim.keymap.set('i', '<M-l>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
        vim.keymap.set('i', '<M-,>', function() return vim.fn['codeium#Clear']() end, { expr = true })

        vim.g.codeium_no_map_tab = 1
    end
}
