local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end

vim.opt.rtp:prepend(lazypath)

local opts = {
  defaults = {
    lazy = true,
  },
  git = {
    timeout = 3000,
  },
  install = {
    colorscheme = { 'poimandres' },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'getscript',
        'getscriptPlugin',
      },
    },
  },
}

require('lazy').setup('plugins', opts)
