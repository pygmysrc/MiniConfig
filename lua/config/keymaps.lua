local keys = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

keys("n", "<tab>", "<cmd>e #<cr>", { desc = 'Switch buffer' }) -- switch buffers
keys('n', 'H', ':bprev<cr>', { desc = 'Previous buffer' })
keys('n', 'L', ':bnext<cr>', { desc = 'Next buffer' })

keys('n', '-', require('oil').open, { desc = 'Files' }) -- open files
keys('n', 's', ':w<cr>', { desc = 'Save' })             -- save
keys('n', 'Q', '<cmd>qa!<cr>', { desc = 'Quit' })       -- quit

keys("v", "<", "<gv")                                   -- better indenting
keys("v", ">", ">gv")

keys("n", "gw", "*N", opts) -- search word / selection
keys("v", "gw", "*", opts)  --

-- Leader mappings
keys("v", "<leader>s", '!sort -u<cr>', { desc = 'Sort lines' })
keys("n", "<leader>ui", vim.show_pos, { desc = 'Highlight under cursor', silent = true }) -- highlights under cursor
keys('n', '<leader>e', require('oil').open, { desc = 'Open files' })                      -- toggle oil
keys('n', '<leader>d', ':bd<cr>', { desc = 'Delete buffer' })                             -- delete buffer
keys('n', '<leader>D', ':%bd<cr>', { desc = 'Delete buffer' })                            -- delete all buffers
keys('n', '<leader>q', ':qa!<cr>', { desc = 'Quit' })                                     -- quit
keys('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format buffer' })                    -- lsp formatting
keys('n', '<leader>l', ':Lazy<cr>', { desc = 'Lazy' })                                    -- toggle Lazy
keys('n', '<leader>o', ':only!<cr>', { desc = 'Only window' })                            -- only window
keys('n', '<leader>w', ':set wrap!<cr>', { desc = 'Toggle wrap' })                        -- toggle wrap
keys('n', '<leader>x', ':xa<cr>', { desc = 'Save and quit' })                             -- save / quit
keys('n', '<leader>z', ':only!<cr>', { desc = 'Only window' })                            -- only window

-- Mini.bufremove
keys('n', 'q', ':lua MiniBufremove.delete()<cr>', { desc = 'Delete buffer', silent = true }) -- delete buffer

-- Mini.Trailspace
keys('n', '<leader>th', ':lua MiniTrailspace.highlight()<cr>')
keys('n', '<leader>tl', ':lua MiniTrailspace.trim_last_lines()<cr>')
keys('n', '<leader>tt', ':lua MiniTrailspace.trim()<cr>')
keys('n', '<leader>tu', ':lua MiniTrailspace.unhighlight()<cr>')

-- Fuzzy matching

-- Trouble.nvim
keys("n", "<leader>xx", function() require("trouble").open() end)
keys("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
keys("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
keys("n", "<leader>xl", function() require("trouble").open("quickfix") end)
keys("n", "<leader>xq", function() require("trouble").open("loclist") end)
keys("n", "gR", function() require("trouble").open("lsp_references") end)

-- From theprimeagen
keys("v", "J", ":m '>+1<CR>gv=gv") -- move lines
keys("v", "K", ":m '<-2<CR>gv=gv")
keys("n", "J", "mzJ`z")            -- better join
keys("n", "<C-d>", "<C-d>zz")      -- scroll up / down
keys("n", "<C-u>", "<C-u>zz")
keys("n", "n", "nzzzv")            -- search next
keys("n", "N", "Nzzzv")            -- search prev

-- lsp related
keys("n", "gd", function()
  vim.lsp.buf.definition()
end)

keys("n", "K", function()
  vim.lsp.buf.hover()
end)

keys("n", "<leader>vws", function()
  vim.lsp.buf.workspace_symbol('')
end)

keys("n", "<leader>vd", function()
  vim.lsp.diagnostic.open_float()
end)

keys("n", "[d", function()
  vim.lsp.diagnostic.goto_next()
end)

keys("n", "d[", function()
  vim.lsp.diagnostic.goto_prev()
end)

keys("n", "<leader>vca", function()
  vim.lsp.buf.code_action()
end)

keys("n", "<leader>vrr", function()
  vim.lsp.buf.references()
end)

keys("n", "<leader>vrr", function()
  vim.lsp.buf.rename()
end)

keys("i", "<C-h>", function()
  vim.lsp.buf.signature_help()
end)

keys("n", "gu", "<cmd>diffget //2<cr>")
keys("n", "gh", "<cmd>diffget //3<cr>")

-- From lazy.nvim

-- Move around panes
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Add undo break-points
keys("i", ",", ",<c-g>u")
keys("i", ".", ".<c-g>u")
keys("i", ";", ";<c-g>u")

-- Clear search with <esc>
keys({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
