return {
  "shortcuts/no-neck-pain.nvim",
  version = "*", -- usa a versão estável; remova essa linha se quiser a dev (main)
  cmd = "NoNeckPain", -- carrega o plugin só quando você chamar o comando (lazy load)
  keys = {
    { "<leader>uj", "<cmd>NoNeckPain<cr>", desc = "Toggle No Neck Pain" },
  },
  opts = {
    width = 127,
    buffers = {
      colors = {
        background = nil,
      },
    },
  },
}
