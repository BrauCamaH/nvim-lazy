return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        dart = { "dart_format" },
        -- Use the "*" filetype to run formatters on all filetypes.
        ["*"] = { "codespell" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
    },
    formatters = {
      dart_format = {
        command = "dart",
        args = function(ctx)
          local filename = ctx.filename
          if vim.fn.filereadable(filename) ~= 1 then
            return {}
          end
          return { "format", filename }
        end,
        stdin = false,
        timeout_ms = 10000,
      },
    },
  },
}
