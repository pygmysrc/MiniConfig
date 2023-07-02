-- use new module loader
vim.loader.enable()
-- required by lazy.nvim
vim.g.mapleader = ' '

require 'config.bootstrap'
require 'config.options'
require 'config.keymap'
