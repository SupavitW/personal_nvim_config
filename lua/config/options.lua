-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.list = false

vim.opt.shell = "powershell"
vim.opt.scrolloff = 999

vim.o.shiftwidth = 4
vim.tabstop = 4
vim.softtabstop = 4

vim.opt.mouse = ""

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.opt_local.expandtab = false -- Use tabs for Go (standard)
    vim.opt_local.tabstop = 4 -- Display tabs as 4 spaces
    vim.opt_local.shiftwidth = 4
  end,
})

-- Start terminal with terminal mode
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
})
