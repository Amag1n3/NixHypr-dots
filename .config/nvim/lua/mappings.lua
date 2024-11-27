require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- Map Enter in normal mode to go to insert mode
map("n", "<CR>", "i", { desc = "Enter insert mode from normal mode" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
