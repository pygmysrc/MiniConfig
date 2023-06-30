return {
  {
    'williamboman/mason.nvim',
    build = ':MasonUpdate',
    lazy = false,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    config = function()
      require('mason').setup {}
      require('mason-lspconfig').setup {
        ensure_installed = {
          'astro',
          'cssls',
          'cssmodules_ls',
          'html',
          'jsonls',
          'tsserver',
          'vimls',
        },
      }
      require('mason-lspconfig').setup_handlers {
        function(server_name)
          require('lspconfig')[server_name].setup {}
        end,
      }
    end,
  },
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile' },
    lazy = false,
    dependencies = {
      'mason.nvim',
    },
  },
}
