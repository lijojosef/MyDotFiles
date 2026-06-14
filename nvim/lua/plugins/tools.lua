return {
  -- Git changes in file (inline diff and staging interface)
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      {
        "<leader>gd",
        function()
          require("gitsigns").diffthis()
        end,
        desc = "Diff This File",
      },
      {
        "<leader>gp",
        function()
          require("gitsigns").preview_hunk()
        end,
        desc = "Preview Hunk",
      },
      {
        "<leader>gb",
        function()
          require("gitsigns").blame_line({ full = true })
        end,
        desc = "Blame Line (Full)",
      },
      -- { "<leader>gtd", function() require("gitsigns").toggle_deleted() end, desc = "Toggle Deleted Lines" },
      {
        "<leader>gtw",
        function()
          require("gitsigns").toggle_word_diff()
        end,
        desc = "Toggle Word Diff",
      },

      -- Hunk Navigation
      {
        "]h",
        function()
          require("gitsigns").nav_hunk("next")
        end,
        desc = "Next Hunk",
      },
      {
        "[h",
        function()
          require("gitsigns").nav_hunk("prev")
        end,
        desc = "Prev Hunk",
      },
    },
    opts = {},
  },
}
