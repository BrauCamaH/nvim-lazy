return {
  {
    "reisub0/hot-reload.vim",
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
      "ibhagwan/fzf-lua", -- fzf-lua
    },
    keys = {
      {
        "..",
        function()
          local fzf = require("fzf-lua")

          -- Get all commands and filter only Flutter*
          local cmds = vim.api.nvim_get_commands({})
          local flutter_cmds = {}
          for name, _ in pairs(cmds) do
            if name:match("^Flutter") then
              table.insert(flutter_cmds, name)
            end
          end

          table.sort(flutter_cmds)
          fzf.fzf_exec(flutter_cmds, {
            prompt = " Flutter > ",
            winopts = {
              height = 0.40, -- similar to LazyVim
              width = 0.30,
              row = 0.5,
              col = 0.5,
              border = "rounded",
              backdrop = 100, -- dim background
              hl = {
                border = "FloatBorder",
                cursor = "Cursor",
                normal = "Normal",
              },
            },
            fzf_opts = {
              ["--layout"] = "reverse",
              ["--info"] = "inline",
              ["--prompt"] = " Flutter > ",
            },
            actions = {
              ["default"] = function(selected)
                if selected and selected[1] then
                  vim.cmd(selected[1])
                end
              end,
            },
          })
        end,
        desc = "Flutter Commands (fzf-lua autodetect, nice UI)",
      },
    },
    config = function()
      require("flutter-tools").setup({
        decorations = {
          statusline = {
            app_version = true,
            device = true,
            project_config = true,
          },
        },
        root_patterns = { ".git", "pubspec.yaml" },
        fvm = false,
        widget_guides = { enabled = true },
        closing_tags = {
          highlight = "ErrorMsg",
          prefix = ">",
          priority = 10,
          enabled = false,
        },
        dev_log = {
          enabled = true,
          notify_errors = false,
          open_cmd = "15split",
          focus_on_open = true,
        },
        dev_tools = {
          autostart = true,
          auto_open_browser = false,
        },
        outline = {
          open_cmd = "30vnew",
          auto_open = false,
        },
        lsp = {
          on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = true })
              end,
            })
          end,
          color = {
            enabled = true,
            background = false,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "●",
          },
          settings = {
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "prompt",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
        debugger = {
          enabled = false,
          register_configurations = function(_)
            require("dap").configurations.dart = {}
            require("dap.ext.vscode").load_launchjs()
          end,
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      {
        "RobertBrunhage/flutter-riverpod-snippets",
        "ArkrootHQ/freezed-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },
    },
  },
}
