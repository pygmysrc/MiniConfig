local lsp = require('lsp-zero').preset {}

lsp.extend_cmp()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  lsp.buffer_autoformat()
end)

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['lua_ls'] = {'lua'},
    ['rust_analyzer'] = {'rust'},
    -- if you have a working setup with null-ls
    -- you can specify filetypes it can format.
    ['tsserver'] = {'javascript', 'typescript'},
  }
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').tsserver.setup {
  on_attach = function(client, bufnr)
    lsp.default_keymaps { buffer = bufnr }
    print('tsserver attached')
  end,
}
-- require('lspconfig').rome.setup {
--   on_attach = function(client, bufnr)
--     lsp.default_keymaps { buffer = bufnr }
--   end,
-- }

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

-- disable language servers
lsp.skip_server_setup({'eslint', 'tsserver'})

lsp.setup()
