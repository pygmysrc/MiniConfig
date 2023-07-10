return {
  {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {},
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        columns = {
          'mtime',
          'size',
        },
        win_options = {
          wrap = false,
          signcolumn = 'no',
          cursorcolumn = false,
          foldcolumn = '0',
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = 'n',
        },
        keymaps = {
          ['q'] = 'actions.close',
          ['<cr>'] = 'actions.select',
          ['z'] = 'actions.preview',
          ['.'] = 'actions.toggle_hidden',
          ['_'] = 'actions.open_cwd',
        },
        skip_confirm_for_simple_edits = true,
        use_default_keymaps = false,
        show_hidden = true,
        float = {
          win_options = {
            winblend = 0,
          },
          override = function(conf)
            return conf
          end,
        },
      }
    end,
  },
}
