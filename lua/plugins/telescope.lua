return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  cmd = 'Telescope',
  keys = { -- {{{
    {
      '<leader>,',
      '<cmd>Telescope buffers show_all_buffers=true<cr>',
      desc = 'Switch Buffer',
    },
    {
      '<leader>/',
      '<cmd>Telescope live_grep<cr>',
      desc = 'Grep (root dir)',
    },
    {
      '<leader>:',
      '<cmd>Telescope command_history<cr>',
      desc = 'Command History',
    },
    -- { "<leader><space>", '',                                                 desc = "Find Files (root dir)" },
    -- find
    {
      '<leader>fb',
      '<cmd>Telescope buffers<cr>',
      desc = 'Buffers',
    },
    {
      '<leader>ff',
      '<cmd>Telescope find_files<cr>',
      desc = 'Find Files (root dir)',
    },
    -- { "<leader>fF", Util.telescope("files", { cwd = false }), desc = "Find Files (cwd)" },
    {
      '<leader>fr',
      '<cmd>Telescope oldfiles<cr>',
      desc = 'Recent',
    },
    -- { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
    -- git
    {
      '<leader>gc',
      '<cmd>Telescope git_commits<CR>',
      desc = 'commits',
    },
    {
      '<leader>gs',
      '<cmd>Telescope git_status<CR>',
      desc = 'status',
    },
    -- search
    {
      '<leader>sa',
      '<cmd>Telescope autocommands<cr>',
      desc = 'Auto Commands',
    },
    {
      '<leader>sb',
      '<cmd>Telescope current_buffer_fuzzy_find<cr>',
      desc = 'Buffer',
    },
    {
      '<leader>sc',
      '<cmd>Telescope command_history<cr>',
      desc = 'Command History',
    },
    {
      '<leader>sC',
      '<cmd>Telescope commands<cr>',
      desc = 'Commands',
    },
    {
      '<leader>sd',
      '<cmd>Telescope diagnostics bufnr=0<cr>',
      desc = 'Document diagnostics',
    },
    {
      '<leader>sD',
      '<cmd>Telescope diagnostics<cr>',
      desc = 'Workspace diagnostics',
    },
    -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
    -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
    {
      '<leader>sh',
      '<cmd>Telescope help_tags<cr>',
      desc = 'Help Pages',
    },
    {
      '<leader>sH',
      '<cmd>Telescope highlights<cr>',
      desc = 'Search Highlight Groups',
    },
    {
      '<leader>sk',
      '<cmd>Telescope keymaps<cr>',
      desc = 'Key Maps',
    },
    {
      '<leader>sM',
      '<cmd>Telescope man_pages<cr>',
      desc = 'Man Pages',
    },
    {
      '<leader>sm',
      '<cmd>Telescope marks<cr>',
      desc = 'Jump to Mark',
    },
    {
      '<leader>so',
      '<cmd>Telescope vim_options<cr>',
      desc = 'Options',
    },
    {
      '<leader>sR',
      '<cmd>Telescope resume<cr>',
      desc = 'Resume',
    },
    -- { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
    -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
    -- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
  }, -- }}}
  opts = {
    defaults = {
      prompt_prefix = ' ',
      selection_caret = ' ',
      mappings = { -- {{{
        i = {
          ['<c-t>'] = function(...)
            return require('trouble.providers.telescope').open_with_trouble(...)
          end,
          ['<a-t>'] = function(...)
            return require('trouble.providers.telescope').open_selected_with_trouble(
              ...
            )
          end,
          ['<C-Down>'] = function(...)
            return require('telescope.actions').cycle_history_next(...)
          end,
          ['<C-Up>'] = function(...)
            return require('telescope.actions').cycle_history_prev(...)
          end,
          ['<C-f>'] = function(...)
            return require('telescope.actions').preview_scrolling_down(...)
          end,
          ['<C-b>'] = function(...)
            return require('telescope.actions').preview_scrolling_up(...)
          end,
        },
        n = {
          ['q'] = function(...)
            return require('telescope.actions').close(...)
          end,
        },
      }, -- }}}
    },
  },
}
