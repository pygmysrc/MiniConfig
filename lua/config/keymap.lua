local map = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

map('n', ' ', ' ', opts)
map('x', ' ', ' ', opts)

map('n', 'H', ':bprev<cr>', opts)
map('n', 'L', ':bnext<cr>', opts)
map('n', 's', ':w<cr>', opts)
map('n', 'q', ':qa!<cr>', opts)
map('n', 'z', ':only!<cr>', opts)

map('n', '<leader>d', ':bdelete<cr>', opts)
map('n', '<leader>x', ':xa<cr>', opts)
--
map('n', '<leader>e', require('oil').open, { desc = 'open parent dir' })
map('n', '-', require('oil').open, opts)

-- native lsp formatting
map('n', '<leader>f', vim.lsp.buf.format)

-- toggle wrap
map('n', '<leader>w', ':set wrap!<cr>')

-- clear search with <esc>
map("n", "<esc>", "<cmd>noh<cr><esc>", opts)

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "gw", "*N", opts)

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
end

map("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

-- switch to other buffer
map("n", "<leader>bb", "<cmd>e #<cr>")
map("n", "<leader>`", "<cmd>e #<cr>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
