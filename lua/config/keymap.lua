local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

map('n', ' ', ' ', opts)
map('x', ' ', ' ', opts)
map('n', 'H', ':bprev<cr>', opts)
map('n', 'L', ':bnext<cr>', opts)
map('n', '<leader>d', ':bdelete<cr>', opts)
map('n', 's', ':w<cr>', opts)
map('n', 'q', ':wq<cr>', opts)
map('n', 'Q', ':qa!<cr>', opts)
map('n', 'z', ':only!<cr>', opts)
map('n', '<leader>w', ':w<cr>', opts)
-- map('n', '<leader>x', ':xa<cr>', opts)

map('n', '<leader>e', require('oil').open, { desc = 'open parent dir' })

map('n', '-', require('oil').open, opts)

-- native lsp formatting
map('n', '<leader>f', vim.lsp.buf.format)

