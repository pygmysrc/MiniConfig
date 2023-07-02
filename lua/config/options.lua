local options = {
  breakindent = true,
  clipboard = 'unnamedplus',
  colorcolumn = '+1',
  complete = { '.', 'w', 'b', 'u', 't', 'i', 'kspell' },
  completeopt = { 'menuone', 'noinsert', 'noselect' },
  expandtab = true,
  fillchars = { fold = ' ', eob = ' ' },
  foldlevel = 0,
  foldmethod = 'marker',
  hidden = true,
  list = false,
  mouse = 'a',
  nrformats = { 'alpha', 'octal', 'hex' },
  number = false,
  numberwidth = 3,
  relativenumber = false,
  scrolloff = 9999,
  shiftround = true,
  shiftwidth = 2,
  showmatch = true,
  showmode = false,
  signcolumn = 'no',
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 450,
  textwidth = 65,
  updatetime = 50,
  virtualedit = { 'block' },
  wildmode = { 'list', 'longest' },
  wrap = false,
  linebreak = true,
  whichwrap = '<>hl',
  undofile = true,
  ignorecase = true,
  cmdheight = 2,
  shortmess = 'aoOstTWAIcCqFS',
}

vim.cmd [[ filetype plugin indent on ]]
-- vim.cmd [[ set shm+=cIt ]]
vim.cmd [[ set background=dark ]]
vim.cmd [[ colorscheme gruvbox ]]

-- do not source default filetype.nvim
vim.g.did_load_filetypes = 1

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.g.bullets_enabled_file_types = {
  'gitcommit',
  'markdown',
  'scratch',
  'text',
  'wiki',
}
