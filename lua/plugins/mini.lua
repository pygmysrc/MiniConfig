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
    require('mini.tabline').setup {
      show_icons = false,
      set_vim_settings = true,
      tabpage_section = 'left',
    }
    require('mini.statusline').setup {
      use_icons = false,
    }
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },
        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
    require('mini.align').setup {}
    require('mini.bufremove').setup {}
    require('mini.bracketed').setup {}
    require('mini.fuzzy').setup {}
    require('mini.indentscope').setup {}
    require('mini.trailspace').setup {}
  end,
}
