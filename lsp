return {
  'hrsh7th/nvim-cmp',
  enabled = true,
  event = 'InsertEnter',
  sources = {
    { name = 'nvim_lsp' },
  },
  dependencies = {
    -- sources
    {'hrsh7th/cmp-nvim-lsp', opts = {}},
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-emoji',
    -- snippets
    'L3MON4D3/LuaSnip',
  },
  opts = function()
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
  config = function()
    vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    require('luasnip.loaders.from_vscode').lazy_load()
    local select_opts = { behavior = cmp.SelectBehavior.Select }
    cmp.setup {
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'buffer', keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      formatting = {
        fields = { 'menu', 'abbr', 'kind' },
        format = function(entry, item)
          local menu_icon = {
            nvim_lsp = 'λ',
            luasnip = '⋗',
            buffer = 'Ω',
            path = '🖫',
          }

          item.menu = menu_icon[entry.source.name]
          return item
        end,
      },
      -- See :help cmp-mapping
      mapping = {
        ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
        ['<Down>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
        ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-e>'] = cmp.mapping.abort(),
        ['<C-y>'] = cmp.mapping.confirm { select = true },
        ['<CR>'] = cmp.mapping.confirm { select = false },

        ['<C-f>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<C-b>'] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<Tab>'] = cmp.mapping(function(fallback)
          local col = vim.fn.col '.' - 1

          if cmp.visible() then
            cmp.select_next_item(select_opts)
          elseif col == 0 or vim.fn.getline('.'):sub(col, col):match '%s' then
            fallback()
          else
            cmp.complete()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(select_opts)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
    }
  end,
}
