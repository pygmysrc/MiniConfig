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
        starter.sections.recent_files(3, true),
        -- Use this if you set up 'mini.sessions'
        -- starter.sections.sessions(5, true),
      },
      header = '',
      footer = '',
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning('center', 'center'),
        starter.gen_hook.indexing('all', { 'Builtin actions' }),
      },
      silent = true,
    }
    require('mini.bufremove').setup {}
    require('mini.indentscope').setup {}
    require('mini.tabline').setup {
      show_icons = false,
      tabpage_section = 'right',
    }
    require('mini.statusline').setup {
      use_icons = false,
    }
  end,
}
