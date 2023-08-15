return {
  {
    'mfussenegger/nvim-dap',
    lazy = false,
    config = function()
      local dap = require 'dap'
      dap.adapters.go = function(callback, config)
        -- Wait for delve to start
        vim.defer_fn(function()
          callback { type = 'server', host = '127.0.0.1', port = 'port' }
        end, 100)
      end
      dap.configurations.go = {
        type = 'go',
        name = 'Debug',
        request = 'launch',
        program = '${file}',
      }
    end,
  },
  {
    'leoluz/nvim-dap-go',
    lazy = false,
    config = function()
      require('dap-go').setup()
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    lazy = false,
    config = function()
      local dap, dapui = require 'dap', require 'dapui'
      dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close()
      end
      -- make the breakpoints look nicer
      vim.fn.sign_define(
        'DapBreakpoint',
        { text = '🟥', texthl = '', linehl = '', numhl = '' }
      )
      vim.fn.sign_define(
        'DapStopped',
        { text = '▶️', texthl = '', linehl = '', numhl = '' }
      )
    end,
  },
}
