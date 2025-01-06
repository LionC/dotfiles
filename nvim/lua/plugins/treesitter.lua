return {
    -- vim.wo.foldmethod   = 'expr'
    -- vim.wo.foldexpr     = vim.api.nvim_call_function('nvim_treesitter#foldexpr', {})
    { 'nvim-treesitter/nvim-treesitter',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = 'all',
            ignore_install = { 'haskell', 'phpdoc' },
            highlight = {
                enable = true,
            },
            textobjects = {
                select = {
                    enable = true,
                    -- TODO fix those, see treesitter repo for builtins
                    -- keymaps = {
                    --     ['af'] = '@function.outer',
                    --     ['if'] = '@function.inner',
                    --     ['ac'] = '@comment.outer',
                    --     ['ic'] = '@comment.inner',
                    --     ['ap'] = '@property.outer',
                    --     ['ip'] = '@property.inner',
                    --     ['av'] = '@variable.outer',
                    --     ['iv'] = '@variable.inner',
                    --     ['as'] = '@string.outer',
                    --     ['is'] = '@string.inner',
                    --     ['ab'] = '@scope.outer',
                    --     ['ib'] = '@scope.inner',
                    --     ['an'] = '@number',
                    --     -- operator
                    -- },
                },
                swap = {
                    enable = true,
                },
            },
            textsubjects = {
                enable = true,
                keymaps = {
                    ['.'] = 'textsubjects-smart',
                },
            },
        },
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = {
        'nvim-treesitter/nvim-treesitter',
    }},
    { 'RRethy/nvim-treesitter-textsubjects', after = {
        'nvim-treesitter',
    }},
}
