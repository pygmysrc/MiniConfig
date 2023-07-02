vim.loader.enable() -- use new module loader
vim.g.mapleader = ' ' -- required by lazy.nvim

require 'config.bootstrap'
require 'config.options'
require 'config.keymap'
