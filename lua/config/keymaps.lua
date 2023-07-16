local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

-- map('n', ' ', ' ', opts)
-- map('x', ' ', ' ', opts)

map("n", "<tab>", "<cmd>e #<cr>", { desc = 'Switch buffer' }) -- switch buffers
map('n', 'H', ':bprev<cr>', { desc = 'Previous buffer' })
map('n', 'L', ':bnext<cr>', { desc = 'Next buffer' })

map('n', '-', require('oil').open, { desc = 'Files' }) -- open files
map('n', 's', ':w<cr>', { desc = 'Save' })             -- save
map('n', 'q', ':qa!<cr>', { desc = 'Quit' })           -- quit

map("v", "<", "<gv")                                   -- better indenting
map("v", ">", ">gv")

map("n", "gw", "*N", opts) -- search word / selection
map("v", "gw", "*", opts)  --

map("v", "<leader>s", '!sort -u<cr>', { desc = 'Sort lines' })

map("n", "<leader>ui", vim.show_pos, { desc = 'Highlight under cursor', silent = true }) -- highlights under cursor

-- Leader mappings
map('n', '<leader>e', require('oil').open, { desc = 'Open files' })   -- toggle oil
map('n', '<leader>d', ':bdelete<cr>', { desc = 'Delete buffer' })     -- delete buffer
map('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format buffer' }) -- lsp formatting
map('n', '<leader>l', ':Lazy<cr>', { desc = 'Lazy' })                 -- toggle Lazy
map('n', '<leader>o', ':only!<cr>', { desc = 'Only window' })         -- only window
map('n', '<leader>w', ':set wrap!<cr>', { desc = 'Toggle wrap' })     -- toggle wrap
map('n', '<leader>x', ':xa<cr>', { desc = 'Save and quit' })          -- save / quit
map('n', '<leader>z', ':only!<cr>', { desc = 'Only window' })         -- only window

-- Mini.Trailspace
map('n', '<leader>th', ':lua MiniTrailspace.highlight()<cr>')
map('n', '<leader>tl', ':lua MiniTrailspace.trim_last_lines()<cr>')
map('n', '<leader>tt', ':lua MiniTrailspace.trim()<cr>')
map('n', '<leader>tu', ':lua MiniTrailspace.unhighlight()<cr>')

-- Fuzzy matching

-- From theprimeagen
map("v", "J", ":m '>+1<CR>gv=gv") -- move lines
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "J", "mzJ`z")            -- better join
map("n", "<C-d>", "<C-d>zz")      -- scroll up / down
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")            -- search next
map("n", "N", "Nzzzv")            -- search prev

-- From lazy.nvim
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

