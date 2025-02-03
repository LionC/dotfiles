return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason.nvim',
        'LionC/nest.nvim',
        'rmagatti/goto-preview',
        'saghen/blink.cmp',
        'nvimtools/none-ls.nvim',
        'jay-babu/mason-null-ls.nvim',
        'Fildo7525/pretty_hover',
    },
    config = function()
        local nvim_lsp = require 'lspconfig'
        local lspUtil = require 'lspconfig.util'

        local lsp = require 'lsp'
        local options = lsp.get_lsp_options {
            nest = require 'nest',
            goto_preview = require 'goto-preview',
            blink = require 'blink.cmp',
            pretty_hover = require 'pretty_hover',
        }
        local on_attach = options.on_attach
        local capabilities = options.capabilities

        -- Setup non-Mason LSPs
        nvim_lsp.sourcekit.setup {
            on_attach = on_attach,
            cpabilities = capabilities,
        }

        --- @type MasonLspconfigSettings
        require 'mason-lspconfig'.setup {
            ensure_installed = {
                'gopls',
                'denols',
                'rust_analyzer',
                'ocamllsp',
                'terraformls',
                'graphql',
                'lua_ls',
                'ts_ls',
            },
            automatic_installation = true,
            handlers = {
                function(server_name)
                    nvim_lsp[server_name].setup {
                        on_attach = on_attach,
                        capabilities = capabilities,
                    }
                end,
                lua_ls = function()
                    nvim_lsp.lua_ls.setup {
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = {
                                    version = 'LuaJIT',
                                },
                                diagnostics = {
                                    globals = { 'vim' },
                                },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file('', true),
                                },
                                telemetry = {
                                    enable = false,
                                },
                            },
                        }
                    }
                end,
                denols = function()
                    local cwd = vim.fn.getcwd()
                    local denoConfigFound = vim.fs.root(cwd, { 'deno.json', 'deno.jsonc' }) ~= nil

                    if denoConfigFound then
                        nvim_lsp.denols.setup {
                            on_attach = on_attach,
                            capabilities = capabilities,
                            init_options = {
                                enable = true,
                                lint = true,
                            },
                        }

                        local null = require 'null-ls'

                        null.deregister(null.builtins.formatting.prettier)
                        null.deregister(require 'none-ls.diagnostics.eslint_d')
                        null.deregister(require 'none-ls.code_actions.eslint_d')
                    end
                end,
                ts_ls = function()
                    local cwd = vim.fn.getcwd()
                    local denoConfigFound = vim.fs.root(cwd, { 'deno.json', 'deno.jsonc' }) ~= nil
                    local packageJsonFound = vim.fs.root(cwd, { 'package.json' }) ~= nil

                    if (not denoConfigFound) and packageJsonFound then
                        -- Typescript LS
                        nvim_lsp.ts_ls.setup {
                            root_dir = lspUtil.root_pattern('.git'),
                            on_attach = function(client, buf)
                                client.server_capabilities['documentFormattingProvider'] = false
                                client.server_capabilities['documentRangeFormattingProvider'] = false

                                on_attach(client, buf)
                            end,
                            capabilities = capabilities,
                            init_options = {
                                enable = true,
                                lint = true,
                            },
                        }

                        local null = require 'null-ls'

                        null.register(null.builtins.formatting.prettier)
                        null.register(require 'none-ls.diagnostics.eslint_d')
                        null.register(require 'none-ls.code_actions.eslint_d')
                    end
                end,
            }
        }
    end,
}
