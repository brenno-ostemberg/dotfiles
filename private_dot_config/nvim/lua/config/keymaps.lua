-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Toggle da status bar (lualine)
local laststatus = vim.o.laststatus

vim.keymap.set("n", "<leader>uk", function()
  if vim.o.laststatus == 0 then
    vim.o.laststatus = laststatus ~= 0 and laststatus or 3
  else
    laststatus = vim.o.laststatus
    vim.o.laststatus = 0
  end
end, { desc = "Toggle statusline" })

vim.keymap.set("n", "<leader>ts", function()
  if vim.o.background == "dark" then
    vim.o.background = "light"
    vim.cmd.colorscheme("base46-one_light")
  else
    vim.o.background = "dark"
    vim.cmd.colorscheme("base46-onedark")
  end
end, { desc = "Toggle theme dark/light" })
