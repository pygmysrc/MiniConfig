return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { -- Optional
      'williamboman/mason.nvim',
      build = function(vim)
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        require('mason').setup()
        require('mason-lspconfig').setup {
          ensure_installed = {
            'astro',
            'cssls',
            'cssmodules_ls',
            'html',
            'jsonls',
            'taplo',
            'tsserver',
            'vimls',
            'yamlls'
          },
        }
      end,
    }, -- Optional
    {
      'hrsh7th/nvim-cmp',
      config = function()
        local cmp = require 'cmp'
        cmp.setup {
          mapping = {
            ['<cr>'] = cmp.mapping.confirm { select = true },
          },
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
          },
        }
      end,
    }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' }, -- Required
  },
}
