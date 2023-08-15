return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- after loading cmp
      -- then setup your lsp server as usual
      local lspconfig = require 'lspconfig'
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          lspconfig[server_name].setup {
            capabilities = lsp_capabilities,
          }
        end,
      }
      -- example to setup lua_ls and enable call snippets
      lspconfig.lua_ls.setup {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
          },
        },
      }
    end,
    servers = {
        jsonls = {},
        tsserver = {},
        lua_ls = {
          -- mason = false, -- set to false if you don't want this server to be installed with mason
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      },
    dependencies = {
      {
        'williamboman/mason-lspconfig.nvim',
        opts = {
          ensure_installed = { 'lua_ls', 'tsserver' },
        },
        dependencies = {
          {
            'williamboman/mason.nvim',
            opts = {
              border = 'single',
              ensure_installed = {
                'stylua',
                'prettierd',
              },
            },
          },
          { 'hrsh7th/cmp-nvim-lsp', opts = {} },
        },
      },
    },
  },
}
