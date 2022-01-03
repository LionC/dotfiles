local nvim_lsp = require 'lspconfig'
local lspPath = require 'lspconfig.util'.path
local nest = require 'nest'

local border = {
      {" ", "FloatBorder"},
      {"▔", "FloatBorder"},
      {" ", "FloatBorder"},
      {"▕", "FloatBorder"},
      {" ", "FloatBorder"},
      {"▁", "FloatBorder"},
      {" ", "FloatBorder"},
      {"▏", "FloatBorder"},
}

vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]


local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Add borderds to floating LSP windows
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, {border = border})
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, {border = border})

  vim.cmd 'command! LspDef lua vim.lsp.buf.definition()'
  vim.cmd 'command! LspFormatting lua vim.lsp.buf.formatting()'
  vim.cmd 'command! LspCodeAction lua vim.lsp.buf.code_action()'
  vim.cmd 'command! LspHover lua vim.lsp.buf.hover()'
  vim.cmd 'command! LspRename lua vim.lsp.buf.rename()'
  vim.cmd 'command! LspRefs lua vim.lsp.buf.references()'
  vim.cmd 'command! LspTypeDef lua vim.lsp.buf.type_definition()'
  vim.cmd 'command! LspImplementation lua vim.lsp.buf.implementation()'
  vim.cmd 'command! LspDiagPrev lua vim.diagnostic.goto_prev()'
  vim.cmd 'command! LspDiagNext lua vim.diagnostic.goto_next()'
  vim.cmd 'command! LspDiagLine lua vim.diagnostic.open_float()'
  vim.cmd 'command! LspSignatureHelp lua vim.lsp.buf.signature_help()'

  local lsp = vim.lsp.buf
  local diag = vim.diagnostic

  nest.applyKeymaps {
      buffer = true,

      { 'g', {
          { 'd', lsp.definition },
          { 'y', lsp.type_definition },
          { 'i', lsp.implementation },
          { 'r', lsp.references },
          { 'D', lsp.declaration },
      }},

      { 'K', lsp.hover },
      { ']d', diag.goto_next },
      { '[d', diag.goto_prev },
  }

  if client.resolved_capabilities.document_formatting then
    vim.cmd 'autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()'
  end
end

local function hasPackageJson(path)
    local checkPath = lspPath.join(path, 'package.json')
    local exists = lspPath.exists(checkPath)
    return exists
end

local cwd = vim.fn.getcwd()

if hasPackageJson(cwd) or lspPath.traverse_parents(cwd, hasPackageJson) then
    -- Yarn pnp workaround
    vim.cmd [[
        function! ParseURI(uri)
            return substitute(a:uri, '%\([a-fA-F0-9][a-fA-F0-9]\)', '\=nr2char("0x" . submatch(1))', "g")
        endfunction

        function! RzipOverride()
            autocmd! zip BufReadCmd   zipfile:*/*
            exe "au! zip BufReadCmd ".g:zipPlugin_ext
            autocmd zip BufReadCmd   zipfile:*/*
                        \ if ParseURI(expand("<amatch>")) !=# expand("<amatch>") |
                        \     sil! exe "bwipeout " . fnameescape(ParseURI(expand("<amatch>"))) |
                        \     exe "keepalt file " . fnameescape(ParseURI(expand("<amatch>"))) |
                        \     sil! exe "bwipeout " . fnameescape(expand("<amatch>")) |
                        \ endif
            autocmd zip BufReadCmd   zipfile:*/* call rzip#Read(ParseURI(expand("<amatch>")), 1)
            exe "au zip BufReadCmd ".g:zipPlugin_ext." call rzip#Browse(ParseURI(expand('<amatch>')))"
        endfunction

        autocmd VimEnter * call RzipOverride()
    ]]

    -- Typescript
    nvim_lsp.tsserver.setup {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false

            local ts_utils = require 'nvim-lsp-ts-utils'
            ts_utils.setup {}
            ts_utils.setup_client(client)

            nest.applyKeymaps {
                buffer = true,

                { '<leader>t', {
                    { 'o', '<cmd>TSLspOrganize<CR>' },
                    { 'r', '<cmd>TSLspRenameFile<CR>' },
                    { 'i', '<cmd>TSLspImportAll<CR>' },
                }},
            }

            on_attach(client, bufnr)
        end,
    }

    local null = require 'null-ls'
    local builtins = null.builtins

    null.config {
        sources = {
            builtins.formatting.prettier,
            builtins.diagnostics.eslint,
        }
    }

    -- Linting & Formatting
    nvim_lsp['null-ls'].setup{
        on_attach = on_attach,
    }
else
    -- Deno
    nvim_lsp.denols.setup {
        on_attach = on_attach,
        init_options = {
            enable = true,
            lint = true,
        },
    }
end

-- Rust
nvim_lsp.rust_analyzer.setup { on_attach = on_attach }

-- GraphQL
nvim_lsp.graphql.setup { on_attach = on_attach }

-- Lua with Nvim
local sumneko_root_path = '/usr/local/opt/lua-language-server'
local sumneko_binary = sumneko_root_path..'/bin/macOS/lua-language-server'
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')
nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, '-E', sumneko_root_path .. '/main.lua'};
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
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
  },
}

