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
  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "bugreport",
        "compiler",
        "ftplugin",
        "getscript",
        'getscript',
        "getscriptPlugin",
        'getscriptPlugin',
        "gzip",
        'gzip',
        "logipat",
        "matchit",
        'matchit',
        'matchparen',
        "netrw",
        "netrwFileHandlers",
        "netrwPlugin",
        'netrwPlugin',
        "netrwSettings",
        'nvim',
        "optwin",
        "rplugin",
        'rplugin',
        "rrhelper",
        -- "spellfile",
        "spellfile_plugin",
        "synmenu",
        "syntax",
        "tar",
        "tarPlugin",
        'tarPlugin',
        "tohtml",
        'tohtml',
        "tutor",
        'tutor',
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        'zipPlugin',
      },
    },
  },
  -- not using nerd fonts
  ui = {
    icons = {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
}

require('lazy').setup('plugins', opts)
