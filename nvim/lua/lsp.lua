local nvim_lsp = require 'lspconfig'
local lspUtil = require 'lspconfig.util'
local lspPath = lspUtil.path
local nest = require 'nest'
local cmpLsp = require 'cmp_nvim_lsp'

vim.diagnostic.config {     
    float = { border = "rounded" }, 
}

vim.cmd [[autocmd ColorScheme * highlight NormalFloat guibg=#1f2335]]
vim.cmd [[autocmd ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

local capabilities = cmpLsp.default_capabilities()

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Add borderds to floating LSP windows
  vim.lsp.handlers["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

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

  if client.server_capabilities["documentFormattingProvider"] then
    vim.cmd [[
        autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
    ]]
  end
end

local function hasPackageJson(path)
    local checkPath = lspPath.join(path, 'package.json')
    local exists = lspPath.exists(checkPath)

    return exists
end

local function hasDenoConfig(path)
    local jsonPath = lspPath.join(path, 'deno.json')
    local jsonExists = lspPath.exists(jsonPath)

    local jsoncPath = lspPath.join(path, 'deno.jsonc')
    local jsoncExists = lspPath.exists(jsoncPath)

    return jsonExists or jsoncExists
end

local cwd = vim.fn.getcwd()
local denoConfigFound = hasDenoConfig(cwd) or lspPath.traverse_parents(cwd, hasDenoConfig)
local packageJsonFound = hasPackageJson(cwd) or lspPath.traverse_parents(cwd, hasPackageJson)

if (not denoConfigFound) and packageJsonFound then
    -- Typescript
    require 'typescript'.setup {
        server = { -- pass options to lspconfig's setup method
            -- Speed up tsserver by requiring the root directory to be a git repo
            root_dir = lspUtil.root_pattern(".git"),
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                client.server_capabilities["documentFormattingProvider"] = false
                client.server_capabilities["documentRangeFormattingProvider"] = false

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
        },
    }

    -- Linting & Formatting
    local null = require 'null-ls'
    local builtins = null.builtins

    null.setup {
        sources = {
           builtins.formatting.prettier,
           builtins.diagnostics.eslint,
           require 'typescript.extensions.null-ls.code-actions',
        },
        capabilities = capabilities,
        on_attach = on_attach,
    }
else
    -- Deno
    nvim_lsp.denols.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        init_options = {
            enable = true,
            lint = true,
        },
    }
end

-- Go
nvim_lsp.gopls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Rust
nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Terraform
nvim_lsp.terraformls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- GraphQL
nvim_lsp.graphql.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Lua with Nvim
nvim_lsp.lua_ls.setup {
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

