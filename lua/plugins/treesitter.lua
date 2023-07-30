return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require 'nvim-treesitter.install'.prefer_git = false
      require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
      require 'nvim-treesitter.configs'.setup {}
    end,
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    cmd = { 'TSUpdateSync' },
    keys = {
      { "<c-space>", desc = "Increment selection" },
      { "<bs>",      desc = "Decrement selection", mode = "x" },
    },
    opts = {
      autotag = {
        enable = true
      },
      highlight = { enabled = true },
      indent = { enabled = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
      ensure_installed = {
        'bash',
        'c',
        'css',
        'fish',
        'html',
        'javascript',
        'json',
        'lua',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'regex',
        'rust',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'toml',
        'yaml',
      },
      filetypes = {
        'html',
        'javascript',
        'javascriptreact',
        'lua',
        'typescript',
        'typescriptreact',
      },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
}
