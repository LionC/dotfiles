return {
    {
        'nvim-treesitter/nvim-treesitter',
        main = 'nvim-treesitter.configs',
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = 'all',
                sync_install = false,
                auto_install = false,
                ignore_install = {},
                highlight = {
                    enable = true,
                },
                modules = {}, -- types want this but it is not documented
                textobjects = {
                    select = {
                        enable = true,
                        keymaps = {
                            ['ia'] = '@attribute.inner',
                            ['aa'] = '@attribute.outer',
                            ['io'] = '@block.inner',
                            ['ao'] = '@block.outer',
                            ['it'] = '@class.inner',
                            ['at'] = '@class.outer',
                            ['ic'] = '@call.inner',
                            ['ac'] = '@call.outer',
                            ['in'] = '@conditional.inner',
                            ['an'] = '@conditional.outer',
                            ['im'] = '@comment.inner',
                            ['am'] = '@comment.outer',
                            ['if'] = '@function.inner',
                            ['af'] = '@function.outer',
                            ['ii'] = '@loop.inner',
                            ['ai'] = '@loop.outer',
                            ['ir'] = '@parameter.inner',
                            ['ar'] = '@parameter.outer',
                            ['ix'] = '@regex.inner',
                            ['ax'] = '@regex.outer',
                            ['ad'] = '@number.inner',
                            ['id'] = '@number.inner',
                            ['ae'] = '@statement.outer',
                        }
                    },
                    swap = {
                        enable = true,
                        swap_next = {
                            ['<leader>sa'] = '@attribute.outer',
                            ['<leader>so'] = '@block.outer',
                            ['<leader>st'] = '@class.outer',
                            ['<leader>sc'] = '@call.outer',
                            ['<leader>sn'] = '@conditional.outer',
                            ['<leader>sm'] = '@comment.outer',
                            ['<leader>sf'] = '@function.outer',
                            ['<leader>si'] = '@loop.outer',
                            ['<leader>sr'] = '@parameter.outer',
                            ['<leader>sx'] = '@regex.outer',
                            ['<leader>se'] = '@statement.outer',
                        },
                        swap_previous = {
                            ['<leader>sA'] = '@attribute.outer',
                            ['<leader>sO'] = '@block.outer',
                            ['<leader>sT'] = '@class.outer',
                            ['<leader>sC'] = '@call.outer',
                            ['<leader>sN'] = '@conditional.outer',
                            ['<leader>sM'] = '@comment.outer',
                            ['<leader>sF'] = '@function.outer',
                            ['<leader>sI'] = '@loop.outer',
                            ['<leader>sR'] = '@parameter.outer',
                            ['<leader>sX'] = '@regex.outer',
                            ['<leader>sE'] = '@statement.outer',
                        },
                    },
                    move = {
                        enable = true,
                        goto_next_start = {
                            [']xa'] = '@attribute.outer',
                            [']xo'] = '@block.outer',
                            [']xt'] = '@class.outer',
                            [']xc'] = '@call.outer',
                            [']xn'] = '@conditional.outer',
                            [']xm'] = '@comment.outer',
                            [']xf'] = '@function.outer',
                            [']xi'] = '@loop.outer',
                            [']xr'] = '@parameter.outer',
                            [']xx'] = '@regex.outer',
                            [']xe'] = '@statement.outer',
                        },
                        goto_next_end = {
                            [']xA'] = '@attribute.outer',
                            [']xO'] = '@block.outer',
                            [']xT'] = '@class.outer',
                            [']xC'] = '@call.outer',
                            [']xN'] = '@conditional.outer',
                            [']xM'] = '@comment.outer',
                            [']xF'] = '@function.outer',
                            [']xI'] = '@loop.outer',
                            [']xR'] = '@parameter.outer',
                            [']xX'] = '@regex.outer',
                            [']xE'] = '@statement.outer',
                        },
                        goto_previous_start = {
                            ['[xa'] = '@attribute.outer',
                            ['[xo'] = '@block.outer',
                            ['[xt'] = '@class.outer',
                            ['[xc'] = '@call.outer',
                            ['[xn'] = '@conditional.outer',
                            ['[xm'] = '@comment.outer',
                            ['[xf'] = '@function.outer',
                            ['[xi'] = '@loop.outer',
                            ['[xr'] = '@parameter.outer',
                            ['[xx'] = '@regex.outer',
                            ['[xe'] = '@statement.outer',
                        },
                        goto_previous_end = {
                            ['[xA'] = '@attribute.outer',
                            ['[xO'] = '@block.outer',
                            ['[xT'] = '@class.outer',
                            ['[xC'] = '@call.outer',
                            ['[xN'] = '@conditional.outer',
                            ['[xM'] = '@comment.outer',
                            ['[xF'] = '@function.outer',
                            ['[xI'] = '@loop.outer',
                            ['[xR'] = '@parameter.outer',
                            ['[xX'] = '@regex.outer',
                            ['[xE'] = '@statement.outer',
                        },
                    },
                },
                textsubjects = {
                    enable = true,
                    keymaps = {
                        ['.'] = 'textsubjects-smart',
                    },
                },
            }

            vim.opt.foldmethod     = 'expr'
            vim.opt.foldexpr       = 'v:lua.vim.treesitter.foldexpr()'
            vim.opt.foldcolumn     = '0'
            vim.opt.foldtext       = ''
            vim.opt.foldlevel      = 99
            vim.opt.foldlevelstart = 99
            vim.opt.foldnestmax    = 2
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
        dev = true,
    },
    {
        'RRethy/nvim-treesitter-textsubjects',
        after = {
            'nvim-treesitter',
        },
    },
}
