return {
  'folke/neodev.nvim',
  -- color schemes
  {
    'mcchrish/zenbones.nvim',
    dependencies = 'rktjmp/lush.nvim',
  },
  {
    {
      'rose-pine/neovim',
      name = 'rose-pine',
      config = function()
        require('rose-pine').setup {
          disable_background = true,
        }
      end,
    },
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    config = function()
      require('poimandres').setup {}
    end,
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      require('gruvbox').setup {
        transparent_mode = true,
      }
    end,
  },
}
