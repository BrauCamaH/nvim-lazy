return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    require("telescope").load_extension("harpoon")
  end,
  keys = {
    {
      "<leader>H",
      function()
        require("telescope").extensions.harpoon.marks()
      end,
      desc = "harpoon file telescope",
    },
    {
      "<leader>h",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "harpoon quick menu",
    },
    {
      "<leader>a",
      function()
        require("harpoon"):list():append()
        ---@diagnostic disable-next-line: missing-fields
        require("notify").notify("File appended", "info", {
          icon = "🤠",
          title = "Harpoon",
          timeout = 1500,
        })
      end,
      desc = "harpoon file",
    },
    {
      "<leader>1",
      function()
        require("harpoon"):list():select(1)
      end,
      desc = "harpoon to file 1",
    },
    {
      "<leader>2",
      function()
        require("harpoon"):list():select(2)
      end,
      desc = "harpoon to file 2",
    },
    {
      "<leader>3",
      function()
        require("harpoon"):list():select(3)
      end,
      desc = "harpoon to file 3",
    },
    {
      "<leader>4",
      function()
        require("harpoon"):list():select(4)
      end,
      desc = "harpoon to file 4",
    },
    {
      "<leader>5",
      function()
        require("harpoon"):list():select(5)
      end,
      desc = "harpoon to file 5",
    },
  },
}
