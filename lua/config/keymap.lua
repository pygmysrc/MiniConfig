vim.api.nvim_set_keymap("n", " ", " ", { noremap = true })
vim.api.nvim_set_keymap("x", " ", " ", { noremap = true })

vim.api.nvim_set_keymap("n", "H", ":bprev<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "L", ":bnext<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>d", ":bdelete<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "s", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "q", ":qa!<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>x", ":xa<cr>", { noremap = true })

vim.keymap.set("n", "<leader>e", require("oil").open, { desc = "open parent dir" })
vim.keymap.set("n", "-", require("oil").open, { noremap = true, silent = true })
