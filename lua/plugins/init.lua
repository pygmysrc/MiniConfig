return {
  'folke/neodev.nvim',
  -- color schemes
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
