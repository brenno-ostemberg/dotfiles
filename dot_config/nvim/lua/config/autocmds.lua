-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Troca o tema automaticamente quando o background muda
-- (disparado pelo terminal via OSC 11 quando o OS alterna light/dark)
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    if vim.o.background == "light" then
      vim.cmd.colorscheme("base46-one_light")
    else
      vim.cmd.colorscheme("base46-onedark")
    end
  end,
  desc = "Auto-switch theme with OS dark/light mode",
})

-- Desativa spell check em markdown e texto
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
