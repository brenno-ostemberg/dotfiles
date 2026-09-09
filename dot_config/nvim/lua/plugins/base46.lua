return {
  "AvengeMedia/base46",
  lazy = false, -- precisa carregar no startup para aplicar o colorscheme
  priority = 1000, -- garante que carregue antes dos outros plugins de UI
  opts = {
    -- mantém o terminal integrado e o background ajustado pelo tema
    set_background = true,
    term_colors = true,
    transparency = false,
  },
  config = function(_, opts)
    require("base46").setup(opts)
    vim.cmd.colorscheme("base46-onedark")
  end,
}
