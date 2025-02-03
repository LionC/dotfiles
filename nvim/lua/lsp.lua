--- @class LspSetupDependencies
--- @field nest any
--- @field blink any
--- @field goto_preview any
--- @field pretty_hover any

--- @class LspServerOptions
--- @field capabilities lsp.ClientCapabilities
--- @field on_attach elem_or_list<fun(client: vim.lsp.Client, bufnr: integer)>

--- @type LspServerOptions
local instance = nil

local M = {}

vim.diagnostic.config { float = { border = 'rounded' } }

-- Add borderds to floating LSP windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

--- @diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.open_floating_preview = function(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = opts.border or 'rounded'
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

--- Get on_attach function and capabilities for LSP
--- @param deps LspSetupDependencies
--- @return LspServerOptions
function M.get_lsp_options(deps)
    local nest = deps.nest
    local gotopreview = deps.goto_preview
    local blink = deps.blink
    local pretty_hover = deps.pretty_hover

    if instance == nil then
        instance = {
            capabilities = blink.get_lsp_capabilities(),
            on_attach = function(client)
                local lsp = vim.lsp.buf

                vim.api.nvim_create_user_command('LspDef', lsp.definition, {})
                vim.api.nvim_create_user_command('LspCodeAction', lsp.code_action, {})
                vim.api.nvim_create_user_command('LspHover', lsp.hover, {})
                vim.api.nvim_create_user_command('LspRename', lsp.rename, {})
                vim.api.nvim_create_user_command('LspRefs', lsp.references, {})
                vim.api.nvim_create_user_command('LspTypeDef', lsp.type_definition, {})
                vim.api.nvim_create_user_command('LspImplementation', lsp.implementation, {})
                vim.api.nvim_create_user_command('LspSignatureHelp', lsp.signature_help, {})
                vim.api.nvim_create_user_command('LspDiagPrev', vim.diagnostic.goto_prev, {})
                vim.api.nvim_create_user_command('LspDiagNext', vim.diagnostic.goto_next, {})
                vim.api.nvim_create_user_command('LspDiagLine', vim.diagnostic.open_float, {})

                nest.applyKeymaps {
                    buffer = true,

                    { 'K', pretty_hover.hover },
                    { 'g', {
                        { 'd', lsp.definition },
                        { 'y', lsp.type_definition },
                        { 'i', lsp.implementation },
                        { 'r', lsp.references },
                        { 'D', lsp.declaration },
                        { 'p', {
                            { 'q', gotopreview.close_all_win },
                            { 'd', gotopreview.goto_preview_definition },
                            { 'y', gotopreview.goto_preview_type_definition },
                            { 'i', gotopreview.goto_preview_implementation },
                            { 'r', gotopreview.goto_preview_references },
                            { 'D', gotopreview.goto_preview_declaration },
                        } },
                    } },
                }

                if client.server_capabilities['documentFormattingProvider'] then
                    vim.api.nvim_create_autocmd('BufWritePre', {
                        buffer = vim.api.nvim_get_current_buf(),
                        callback = function()
                            vim.lsp.buf.format()
                            vim.diagnostic.enable()
                        end,
                    })
                end
            end
        }
    end

    return instance
end

return M
