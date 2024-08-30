require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<leader>t", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
