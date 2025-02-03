return {
    'jay-babu/mason-null-ls.nvim',
    dependencies = {
        'williamboman/mason.nvim',
        'nvimtools/none-ls.nvim',
        'LionC/nest.nvim',
        'rmagatti/goto-preview',
        'saghen/blink.cmp',
        'Fildo7525/pretty_hover',
    },
    config = function()
        local lsp = require 'lsp'
        local options = lsp.get_lsp_options {
            nest = require 'nest',
            goto_preview = require 'goto-preview',
            blink = require 'blink.cmp',
            pretty_hover = require 'pretty_hover',
        }
        local on_attach = options.on_attach
        local capabilities = options.capabilities

        require 'null-ls'.setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }

        require 'mason-null-ls'.setup {
            ensure_installed = {
                'eslint_d',
                'prettier',
                'gitsigns',
                'textlint',
                'ts_node_action',
                'checkmake',
                'dotenv_linter',
                'hadolint',
                'ktlint',
                'markdownlint',
                'sqruff',
                'terraform_validate',
                'yamllint',
                'zsh',
                'xmllint',
            },
            methods = {
                diagnostics = true,
                formatting = true,
                code_actions = true,
                completion = false,
                hover = false,
            },
            automatic_installation = true,
            handlers = {
                function(a, b)
                    require 'mason-null-ls'.default_setup(a, b)
                end,
            },
        }
    end,
}
