local nvim_lsp = require 'lspconfig'
local lspUtil = require 'lspconfig.util'
local nest = require 'nest'
local gotopreview = require 'goto-preview'

vim.diagnostic.config { float = { border = 'rounded' } }

local capabilities = require 'blink.cmp'.get_lsp_capabilities()

-- Add borderds to floating LSP windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function (contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = opts.border or 'rounded'
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local on_attach = function(client)
    vim.cmd [[
      command! LspDef               lua vim.lsp.buf.definition()
      command! LspCodeAction        lua vim.lsp.buf.code_action()
      command! LspHover             lua vim.lsp.buf.hover()
      command! LspRename            lua vim.lsp.buf.rename()
      command! LspRefs              lua vim.lsp.buf.references()
      command! LspTypeDef           lua vim.lsp.buf.type_definition()
      command! LspImplementation    lua vim.lsp.buf.implementation()
      command! LspDiagPrev          lua vim.diagnostic.goto_prev()
      command! LspDiagNext          lua vim.diagnostic.goto_next()
      command! LspDiagLine          lua vim.diagnostic.open_float()
      command! LspSignatureHelp     lua vim.lsp.buf.signature_help()
  ]]

    local lsp = vim.lsp.buf

    nest.applyKeymaps {
        buffer = true,

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
        vim.print(client.server_capabilities)
        vim.cmd [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]]
    end
end

-- Servers to always install on setup (includes servers with non-default settings)
local servers = {
    'gopls',
    'rust_analyzer',
    'ocamllsp',
    'terraformls',
    'graphql',
    { 'lua_ls', {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file('', true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    } }
}

-- Setup servers from list above
for _, v in ipairs(servers) do
    if type(v) == 'table' then
        nvim_lsp[v[1]].setup(v[2])
    else
        nvim_lsp[v].setup {
            on_attach = on_attach,
            capabilities = capabilities,
        }
    end
end

-- -------------------------------------------------------------------------------
-- Auotomatically distinguish between Deno TS and Node TS and setup accordingly --
-- -------------------------------------------------------------------------------

local cwd = vim.fn.getcwd()
local denoConfigFound = vim.fs.root(cwd, { 'deno.json', 'deno.jsonc' }) ~= nil
local packageJsonFound = vim.fs.root(cwd, { 'package.json' }) ~= nil

if (not denoConfigFound) and packageJsonFound then
    -- Typescript LS
    nvim_lsp.ts_ls.setup {
        root_dir = lspUtil.root_pattern('.git'),
        on_attach = function(client)
            client.server_capabilities['documentFormattingProvider'] = false
            client.server_capabilities['documentRangeFormattingProvider'] = false

            on_attach(client)
        end,
        capabilities = capabilities,
        init_options = {
            enable = true,
            lint = true,
        },
    }

    -- ESLint Linting & Prettier Formatting via null LS
    local null = require 'null-ls'
    local builtins = null.builtins

    null.setup {
        sources = {
            builtins.formatting.prettier,
            builtins.diagnostics.eslint,
        },
        on_attach = on_attach,
        capabilities = capabilities,
    }
else
    -- Deno LS
    nvim_lsp.denols.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
            enable = true,
            lint = true,
        },
    }
end
