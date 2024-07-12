return {
  {

    "b0o/incline.nvim",
    config = function()
      local colors = {
        blue = "#004c4c",
        cyan = "#79dac8",
        white = "#c6c6c6",
        black = "#080808",
        grey = "#303030",
      }
      local devicons = require("nvim-web-devicons")
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.blue, guifg = colors.white },
            InclineNormalNC = { guifg = colors.white, guibg = colors.black },
          },
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)

          if vim.bo[props.buf].modified then
            filename = "[*]" .. filename
            ft_color = colors.white
          end

          return {
            { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
            { filename .. " ", guifg = ft_color, gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
          }
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
