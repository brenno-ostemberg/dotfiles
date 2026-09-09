return {
  "lewis6991/gitsigns.nvim",
  opts = {
    -- Line blame inline (o que você quer — fica no final de cada linha)
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- aparece no final da linha
      delay = 500,           -- meio segundo de delay ao parar o cursor
    },
    -- Formato: autor, tempo relativo, mensagem do commit
    current_line_blame_formatter = " <author>, <author_time:%d/%m/%Y> · <summary>",

    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = function(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navegação entre hunks
      map("n", "]h", gs.next_hunk, "Next Hunk")
      map("n", "[h", gs.prev_hunk, "Prev Hunk")

      -- Blame
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame Line (popup)")
      map("n", "<leader>gB", gs.blame, "Blame Buffer completo")
      map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Line Blame")

      -- Hunk actions
      map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
      map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
      map("v", "<leader>hs", function()
        gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end, "Stage Hunk (seleção)")
      map("n", "<leader>hS", gs.stage_buffer, "Stage Buffer inteiro")
      map("n", "<leader>hR", gs.reset_buffer, "Reset Buffer inteiro")

      -- Preview do hunk
      map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk (popup)")
      map("n", "<leader>hi", gs.preview_hunk_inline, "Preview Hunk (inline)")

      -- Diff
      map("n", "<leader>hd", gs.diffthis, "Diff contra index")
      map("n", "<leader>hD", function() gs.diffthis("~") end, "Diff contra último commit")

      -- Toggle word diff
      map("n", "<leader>tw", gs.toggle_word_diff, "Toggle Word Diff")
    end,
  },
}
