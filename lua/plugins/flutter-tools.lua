return {
  {
    "reisub0/hot-reload.vim",
  },
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    keys = {
      {
        ";F",
        function()
          require("telescope").extensions.flutter.commands()
        end,
        desc = "Flutter Commands",
      },
    },
    config = function()
      require("flutter-tools").setup({})
      require("telescope").load_extension("flutter")
    end,
  },
}
