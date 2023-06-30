return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {
      'williamboman/mason-lspconfig.nvim',
      config = function()
        require('mason').setup()
        require('mason-lspconfig').setup {
          ensure_installed = {
            'lua_ls',
            'astro',
            'cssls',
            'cssmodules_ls',
            'html',
            'jsonls',
            'tsserver',
            'vimls',
          },
        }
      end,
    }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'L3MON4D3/LuaSnip' }, -- Required
  },
}
