return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "markdown", "markdown_inline", "html", "latex", "yaml" } },
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    priority = 49, -- carrega depois do colorscheme (50)
    opts = {
      preview = {
        icon_provider = "mini",
        hybrid_modes = { "n" },
        linewise_hybrid_mode = true,
      },
    },
    keys = {
      { "<leader>mm", "<cmd>Markview toggle<cr>", desc = "Markview: toggle no buffer" },
      { "<leader>ms", "<cmd>Markview splitToggle<cr>", desc = "Markview: splitview" },
      { "<leader>mh", "<cmd>Markview HybridToggle<cr>", desc = "Markview: modo híbrido" },
    },
  },

  {
    "brianhuster/live-preview.nvim",
    dependencies = { "folke/snacks.nvim" },
    cmd = "LivePreview",
    config = function()
      require("livepreview.config").set({
        port = 5500,
        browser = "default",
        dynamic_root = true,
        sync_scroll = true,
        picker = "snacks.picker",
      })
    end,
    keys = {
      { "<leader>mp", "<cmd>LivePreview start<cr>", desc = "LivePreview: abrir no navegador" },
      { "<leader>mc", "<cmd>LivePreview close<cr>", desc = "LivePreview: fechar" },
      { "<leader>mf", "<cmd>LivePreview pick<cr>", desc = "LivePreview: escolher arquivo" },
    },
  },

  {
    "folke/which-key.nvim",
    opts = { spec = { { "<leader>m", group = "markdown", icon = "" } } },
  },
}
