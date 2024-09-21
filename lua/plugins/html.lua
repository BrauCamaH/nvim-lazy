return {
  {
    "razak17/tailwind-fold.nvim",
    opts = {
      symbol = "🎨", -- 󱏿
      highlight = {
        fg = "#38BDF8", -- [[ symbol color ]]
      },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = { "html", "svelte", "astro", "vue", "typescriptreact", "php", "blade" },
  },
}
