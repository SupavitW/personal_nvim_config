-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("craftzdog.discipline")

discipline.cowboy()

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Remap ESC to enter normal mode during terminal window
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true })

-- Open terminal
keymap.set("n", "<leader>t", ":term<CR>")

-- Exit insert mode
keymap.set("i", "jk", "<ESC>")

-- Navigate begin/end of line during insert mode
keymap.set("i", "<C-h>", "<Left>", { desc = "move left" })
keymap.set("i", "<C-l>", "<Right>", { desc = "move right" })
keymap.set("i", "<C-j>", "<Down>", { desc = "move down" })
keymap.set("i", "<C-k>", "<Up>", { desc = "move up" })
keymap.set("i", "<C-b>", "<ESC>^i")
keymap.set("i", "<C-e>", "<END>")

-- Change directory
keymap.set("n", "cd", ":CdProject<CR>")

-- Close current buffer
keymap.set("n", "<C-x>", ":bd<CR>", { noremap = true, silent = true })

-- Close current window
keymap.set("n", "<C-w>", ":q<CR>", { noremap = true, silent= true})

-- Close current tab
keymap.set("n", "<C-t>", ":tabclose<CR>")

-- Copy to clipboard
keymap.set("n", "<leader>y", '"+y')

-- Delete a word backwards
-- keymap.set("n", "dw", 'vb"_d')

-- Navigate window up/down
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Copy line down (similar to Shift + Alt + Down in VS Code)
keymap.set("n", "<A-Down>", ":t.<CR>")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<enter>", { noremap = true, silent = true })
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
