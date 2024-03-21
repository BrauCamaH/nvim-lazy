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

          local function get_diagnostic_label()
            local icons = { error = " ", warn = " ", info = " ", hint = "✨" }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then
                table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
              end
            end
            if #label > 0 then
              table.insert(label, { "┊ " })
            end
            return label
          end
          return {
            { get_diagnostic_label() },
            { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
            { filename .. " ", guifg = colors.white, gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
          }
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
