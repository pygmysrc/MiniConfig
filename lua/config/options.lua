local options = {
  breakindent = true,
  clipboard = 'unnamedplus',
  cmdheight = 2,
  colorcolumn = '+1',
  completeopt = { 'menuone', 'noinsert', 'noselect' },
  complete = { '.', 'w', 'b', 'u', 't', 'i', 'kspell' },
  conceallevel = 0,
  expandtab = true,
  fillchars = { fold = ' ', eob = ' ' },
  foldlevel = 0,
  foldmethod = 'marker',
  hidden = true,
  hlsearch = true,
  ignorecase = true,
  linebreak = true,
  list = false,
  mouse = 'a',
  nrformats = { 'alpha', 'octal', 'hex' },
  number = false,
  numberwidth = 3,
  relativenumber = false,
  scrolloff = 9999,
  sidescrolloff = 9999,
  shiftround = true,
  shiftwidth = 2,
  -- shortmess = 'aoOstTWAIcCqFS',
  showmatch = true,
  showmode = false,
  showtabline = 2,
  signcolumn = 'no',
  smartcase = true,
  smartindent = true,
  softtabstop = 2,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  textwidth = 65,
  timeoutlen = 450,
  undofile = true,
  updatetime = 50,
  virtualedit = { 'block' },
  whichwrap = 'bs<>[]hl',
  -- wildmode = { 'list', 'longest' },
  wrap = false,
  writebackup = false,
}

vim.cmd [[ filetype plugin indent on ]]
-- vim.cmd [[ set shm+=cIt ]]

-- clear registers
vim.cmd [[ autocmd VimEnter * WipeReg ]]
vim.cmd [[ 
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
 ]]

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
