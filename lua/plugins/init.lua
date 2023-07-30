return {
  { 'folke/neodev.nvim', lazy = false, opts = {} },
  -- {
  --   'dinhhuy258/git.nvim',
  --   lazy = false,
  --   opts = {}
  -- },
  -- Use treesitter to auto close and auto rename html tags
  {
    'windwp/nvim-ts-autotag',
    opts = {}
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },
  -- for colorschemes without lsp highlights
  { 'folke/lsp-colors.nvim', lazy = false, opts = {} },
  -- color schemes
  {
    'mcchrish/zenbones.nvim',
    lazy = false,
    dependencies = 'rktjmp/lush.nvim',
  },
  {
    {
      'rose-pine/neovim',
      name = 'rose-pine',
      opts = {
        disable_background = true,
      }
    },
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {
      transparent_mode = true,
    }
  },
}
