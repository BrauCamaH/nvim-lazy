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
      "ibhagwan/fzf-lua",
      "mfussenegger/nvim-dap",
    },
    keys = {
      {
        "..",
        function()
          local fzf = require("fzf-lua")

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
              height = 0.40,
              width = 0.30,
              row = 0.5,
              col = 0.5,
              border = "rounded",
              backdrop = 100,
            },
            fzf_opts = {
              ["--layout"] = "reverse",
              ["--info"] = "inline",
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
        desc = "Flutter Commands (fzf-lua)",
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
                vim.lsp.buf.format({ async = false })
              end,
            })
          end,

          color = {
            enabled = true,
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
          run_via_dap = true,
          register_configurations = function(_)
            local dap = require("dap")

            dap.configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch Flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }

            pcall(require("dap.ext.vscode").load_launchjs)
          end,
        },
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "RobertBrunhage/flutter-riverpod-snippets",
      "ArkrootHQ/freezed-snippets",
    },
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
