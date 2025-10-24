vim.g.mapleader = "," -- Make sure to set `mapleader` before lazy so your mappings are correct

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
