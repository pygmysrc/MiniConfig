return {
  'echasnovski/mini.nvim',
  version = '*',
  lazy = false,
  config = function()
    local starter = require 'mini.starter'
    starter.setup {
      evaluate_single = true,
      items = {
        starter.sections.builtin_actions(),
        starter.sections.recent_files(3, false),
      },
      header = 'MiniConfig',
      footer = '',
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning('center', 'center'),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
      },
      silent = true,
    }
    require('mini.pairs').setup {
      mappings = {
        ['<'] = { action = 'open', pair = '<>', neigh_pattern = '[^\\].' },
        ['>'] = { action = 'close', pair = '<>', neigh_pattern = '[^\\].' },
      }
    }
    require('mini.tabline').setup {
      show_icons = false,
    }
    require('mini.statusline').setup {
      use_icons = false,
    }
    require('mini.align').setup {}
    require('mini.bufremove').setup {}
    require('mini.bracketed').setup {}
    require('mini.fuzzy').setup {}
    require('mini.indentscope').setup {}
    require('mini.trailspace').setup {}
  end,
}
