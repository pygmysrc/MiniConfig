local lsp = require('lsp-zero').preset {}
-- local lsp = require 'lsp-zero'

lsp.extend_cmp()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps { buffer = bufnr }
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').tsserver.setup {
  on_attach = function(client, bufnr)
    lsp.default_keymaps { buffer = bufnr }
  end,
}
require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

require('lspconfig').yamlls.setup {
  settings = {
    yaml = {
      schemaStore = {
        -- You must disable built-in schemaStore support if you want to use
        -- this plugin and its advanced options like `ignore`.
        enable = false,
      },
      schemas = require('schemastore').yaml.schemas(),
    },
  },
}

lsp.setup()
