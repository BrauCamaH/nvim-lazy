return {
  {
    "ibhagwan/fzf-lua",
    keys = {
      {
        "<leader>ra",
        function()
          local fzf = require("fzf-lua")

          -- Get adb devices (Windows-safe)
          local output = vim.fn.systemlist("adb devices")
          local devices = {}

          for _, line in ipairs(output) do
            line = line:gsub("\r", "")
            if line:match("%sdevice$") then
              local id = line:match("^(%S+)")
              if id then
                table.insert(devices, id)
              end
            end
          end

          if #devices == 0 then
            vim.notify("No ADB devices found", vim.log.levels.WARN)
            return
          end

          fzf.fzf_exec(devices, {
            prompt = "ADB Devices > ",
            actions = {
              ["default"] = function(selected)
                if not selected or not selected[1] then
                  return
                end

                local device = selected[1]
                local port = vim.fn.input("Port to reverse: ")

                if port == "" then
                  return
                end

                vim.fn.jobstart({
                  "adb",
                  "-s",
                  device,
                  "reverse",
                  "tcp:" .. port,
                  "tcp:" .. port,
                })

                vim.notify(("ADB reverse tcp:%s (%s)"):format(port, device), vim.log.levels.INFO)
              end,
            },
          })
        end,
        desc = "ADB Reverse (single port)",
      },
    },
  },
}
