local nvim_lsp = require 'lspconfig'
local nest = require 'nest'

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
  --Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  nest.applyKeymaps {
      buffer = true,

      { 'g', {
          { 'd', '<Cmd>lua vim.lsp.buf.definition()<CR>' },
          { 'y', '<cmd>lua vim.lsp.buf.type_definition()<CR>' },
          { 'i', '<cmd>lua vim.lsp.buf.implementation()<CR>' },
          { 'r', '<cmd>lua vim.lsp.buf.references()<CR>' },
          { 'D', '<Cmd>lua vim.lsp.buf.declaration()<CR>' },
      }},

      { 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>' },
  }
end

-- Rust
nvim_lsp.rust_analyzer.setup {}

-- Typescript / Deno
nvim_lsp.denols.setup { -- or "tsserver"
    init_options = {
      enable = true,
      lint = true,
      -- unstable = true,
    },
    on_attach = on_attach
}

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

