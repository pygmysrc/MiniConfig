-- lazy.nvim
return {
  'folke/noice.nvim',
  enabled = false,
  event = 'VeryLazy',
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    {
      'rcarriga/nvim-notify',
      config = function()
        require('notify').setup {
          background_colour = '#000000',
        }
      end,
    },
  },
  config = function()
    require('noice').setup {
      presets = {
        -- you can enable a preset by setting it to true, or a table that will override the preset config
        -- you can also add custom presets that you can enable/disable with enabled=true
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = false, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
      },
      errors = {
        -- options for the message history that you get with `:Noice`
        view = 'popup',
        opts = { enter = true, format = 'details' },
        filter = { error = true },
        filter_opts = { reverse = true },
      },
      notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = true,
        view = 'notify',
      },
      lsp = {
        progress = {
          enabled = true,
          -- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
          -- See the section on formatting for more details on how to customize.
          --- @type NoiceFormat|string
          format = 'lsp_progress',
          --- @type NoiceFormat|string
          format_done = 'lsp_progress_done',
          throttle = 1000 / 30, -- frequency to update lsp progress message
          view = 'mini',
        },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      cmdline = {
        format = {
          cmdline = { icon = '>' },
          search_down = { icon = '🔍⌄', view = 'cmdline' },
          search_up = { icon = '🔍⌃', view = 'cmdline' },
          filter = { icon = '$' },
          lua = { icon = '☾' },
          help = { icon = '?' },
          level = {
            icons = {
              error = '✖',
              warn = '▼',
              info = '●',
            },
          },
        },
        popupmenu = {
          kind_icons = false,
        },
        inc_rename = {
          cmdline = {
            format = {
              IncRename = { icon = '⟳' },
            },
          },
        },
        views = {
          cmdline_popup = {
            border = {
              style = 'none',
              padding = { 2, 3 },
            },
            filter_options = {},
            win_options = {
              winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
            },
            position = {
              row = 5,
              col = '50%',
            },
            size = {
              width = 60,
              height = 'auto',
            },
          },
          popupmenu = {
            relative = 'editor',
            position = {
              row = 8,
              col = '50%',
            },
            size = {
              width = 60,
              height = 10,
            },
            border = {
              style = 'rounded',
              padding = { 0, 1 },
            },
            win_options = {
              winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
              -- winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
            },
          },
          routes = {
            {
              filter = {
                event = 'msg_show',
                kind = '',
              },
              opts = { skip = true },
            },
          },
        },
      },
    }
  end,
}
