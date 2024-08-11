return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        on_attach = function(buffer)
          local gitsigns = require("gitsigns")

          local function map(mode, l, r, desc)
            vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
          end

          -- Navigation
          map("n", "]h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "]h", bang = true })
            else
              gitsigns.nav_hunk("next")
            end
          end)

          map("n", "[h", function()
            if vim.wo.diff then
              vim.cmd.normal({ "[h", bang = true })
            else
              gitsigns.nav_hunk("prev")
            end
          end)

          -- Actions
          map("n", "<leader>ghs", gitsigns.stage_hunk, "Stage hunk")
          map("n", "<leader>ghr", gitsigns.reset_hunk, "Reset hunk")
          map("v", "<leader>ghs", function()
            gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v"), "Stage hunk" })
          end)
          map("v", "<leader>ghr", function()
            gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v"), "Reset hunk" })
          end)
          map("n", "<leader>ghS", gitsigns.stage_buffer, "Stage buffer")
          map("n", "<leader>ghu", gitsigns.undo_stage_hunk, "Stage hunk")
          map("n", "<leader>ghR", gitsigns.reset_buffer, "Reset buffer")
          map("n", "<leader>ghp", gitsigns.preview_hunk, "Preview hunk")
          map("n", "<leader>ghi", gitsigns.preview_hunk_inline, "Preview hunk inline")
          map("n", "<leader>ghb", function()
            gitsigns.blame_line({ full = true })
          end, "Git Blame Line")
          map("n", "<leader>gtb", gitsigns.toggle_current_line_blame, "Git Toggle Current Line Blame")
          map("n", "<leader>ghd", gitsigns.diffthis, "Git diff file")
          map("n", "<leader>gtd", gitsigns.toggle_deleted, "Git Toggle diff deleted")

          -- Text object
          map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
      })

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})
    end,
  },
}
