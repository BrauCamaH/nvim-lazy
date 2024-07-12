return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { "branch" },
        lualine_c = {
          "%=",
          { "filename", path = 1 },
        },
        lualine_y = {},
        lualine_z = {
          { "filetype", separator = { right = "" }, left_padding = 2 },
        },
      },
    },
  },
}
