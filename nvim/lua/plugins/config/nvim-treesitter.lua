return function ()
    require 'nvim-treesitter.configs'.setup {
        ensure_installed = 'maintained',
        ignore_install = { 'haskell' },
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
    }
end

