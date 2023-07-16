local options = {
  breakindent = true,
  clipboard = 'unnamedplus',
  cmdheight = 2,
  colorcolumn = '+1',
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
  shortmess = 'aoOstTWAIcCqF',
  showmatch = true,
  showmode = false,
  showtabline = 2,
  signcolumn = 'yes',
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
  -- whichwrap = 'bs<>[]hl',
  wildmode = { 'list', 'longest' },
  wrap = false,
  writebackup = false,
}

-- vim.opt.shortmess:append "c"                   -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.whichwrap:append "b,s,<,>,[,],h,l"     -- keys allowed to move to the previous/next line when the beginning/end of line is reached
vim.opt.iskeyword:append "-"                   -- treats words with `-` as single words
vim.opt.formatoptions:remove { "c", "r", "o" } -- This is a sequence of letters which describes how automatic formatting is to be done

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

-- autocmds
local function augroup(name)
  return vim.api.nvim_create_augroup("miniconfig_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = augroup("checktime"),
  command = "checktime",
})

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup("last_loc"),
  callback = function()
    local exclude = { "gitcommit" }
    local buf = vim.api.nvim_get_current_buf()
    if vim.tbl_contains(exclude, vim.bo[buf].filetype) then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(buf, '"')
    local lcount = vim.api.nvim_buf_line_count(buf)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    -- vim.cmd [[ only ]]
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- wrap and check for spell
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown", "json" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- always wrap
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap"),
  pattern = { "typescriptreact" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})
