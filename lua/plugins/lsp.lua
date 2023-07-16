return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    {
      -- Optional
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
            'eslint',
            'marksman',
            'rome',
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
        local luasnip = require 'cmp'
        cmp.setup {
          completion = {
            completeopt = "menu,menuone,noinsert",
          },
          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },
          mapping = {
            ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<S-CR>"] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ['<Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              else
                fallback()
              end
            end,
            ['<S-Tab>'] = function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
              else
                fallback()
              end
            end,
          },
          sources = {
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
            { name = 'path' },
          },
          experimental = {
            ghost_text = {
              hl_group = "CmpGhostText",
            },
          },
        }
      end,
    },                          -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'L3MON4D3/LuaSnip' }, -- Required
  },
}
