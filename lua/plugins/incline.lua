return {

  {

    "b0o/incline.nvim",
    config = function()
      local devicons = require("nvim-web-devicons")
      local colors = {
        blue = "#004c4c",
        cyan = "#79dac8",
        white = "#c6c6c6",
        black = "#080808",
        grey = "#303030",
      }
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.blue, guifg = colors.white },
            InclineNormalNC = { guifg = colors.white, guibg = colors.black },
          },
        },
        render = function(props)
          local function get_git_diff()
            local icons = { removed = "⛔", changed = "🟡", added = "➕" }
            local signs = vim.b[props.buf].gitsigns_status_dict
            local labels = {}
            if signs == nil then
              return labels
            end
            for name, icon in pairs(icons) do
              if tonumber(signs[name]) and signs[name] > 0 then
                table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
              end
            end
            if #labels > 0 then
              table.insert(labels, { "┊ " })
            end
            return labels
          end

          local function get_diagnostic_label()
            local icons = { error = "", warn = " ", info = " ", hint = "✨" }
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
            { get_git_diff() },
            { guibg = "none" },
            { "" .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
            { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
          }
        end,
      })
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
}
