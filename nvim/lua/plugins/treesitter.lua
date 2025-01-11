return {
    { 'nvim-treesitter/nvim-treesitter',
        main = 'nvim-treesitter.configs',
        config = function()
            require 'nvim-treesitter.configs' .setup {
                ensure_installed = 'all',
                sync_install = false,
                auto_install = false,
                ignore_install = { 'haskell', 'phpdoc' },
                highlight = {
                    enable = true,
                },
                modules = {}, -- types want this but it is not documented
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

            vim.opt.foldmethod = 'expr'
            vim.opt.foldexpr   = 'v:lua.vim.treesitter.foldexpr()'
            vim.opt.foldcolumn = '0'
            vim.opt.foldtext = ''
            vim.opt.foldlevel = 99
            vim.opt.foldlevelstart = 99
            vim.opt.foldnestmax    = 2
    end,
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = {
        'nvim-treesitter/nvim-treesitter',
    }},
    { 'RRethy/nvim-treesitter-textsubjects', after = {
        'nvim-treesitter',
    }},
}
