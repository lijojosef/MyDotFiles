return {
  -- 1. Disable Neo-Tree (Since LazyVim utilizes Snacks Explorer out of the box)
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },

  -- 2. Customize Snacks.nvim Layouts and Settings
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true, -- Replaces default netrw with snacks explorer
      },
      picker = {
        sources = {
          explorer = {
            -- Configure the layout structure specifically for the file tree sidebar
            layout = {
              layout = {
                width = 40, -- Sets the width of the explorer drawer sidebar
                position = "left",
              },
            },
          },
        },
      },
    },
  },

  -- 3. Inline Git Blame Visualizer
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    opts = {}, -- Keeps opts available for future customization
  },
}
