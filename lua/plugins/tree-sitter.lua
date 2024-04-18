return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "hiphish/rainbow-delimiters.nvim" },
    opts = {
      ensure_installed = {
        "astro",
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "html",
        "typescript",
        "tsx",
        "php",
        "rust",
        "scss",
        "ruby",
        "lua",
        "sql",
        "svelte",
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      -- MDX
      vim.filetype.add({
        extension = {
          mdx = "mdx",
        },
      })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
